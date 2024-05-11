// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:bloc_test/bloc_test.dart';

import 'package:http/http.dart' as http;
import 'package:rickandmorty/application/list/data_page_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc_action.dart';
import 'package:rickandmorty/application/list/data_page_bloc_event.dart';
import 'package:rickandmorty/domain/models/list/pagination_filter.dart';
import 'package:rickandmorty/infrastructure/service_repository.dart';
import 'package:rickandmorty/presentation/common/button_global.dart';
import 'mock_my_app.dart';
import 'mock_start_app.dart';

class MockBuildContext extends Mock implements BuildContext {}

@GenerateMocks([http.Client])
void main() {
  late MockBuildContext _mockContext;
  late ServiceRepository _mockServiceRepository;
  late DataPageBloc _mockDataPageBloc;

  setUpAll(() {
    // To mock getApplicationDocumentsDirectory
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('plugins.flutter.io/path_provider'),
            (MethodCall methodCall) async {
      return 'documentDirectorymock/.';
    });

    _mockContext = MockBuildContext();
    MockStartApp.registers(_mockContext);
    _mockServiceRepository = GetIt.I.get<ServiceRepository>();
  });

  setUp(() async {
    await setUpTestHive();
    _mockDataPageBloc = DataPageBloc(DataPageBlocAction<BuildContext>(
        DataPageBlocActionType.initial, _mockContext));
  });

  group('Bloc Tests', () {
    blocTest<DataPageBloc, DataPageBlocAction>(
      'Test for change filter name',
      build: () => _mockDataPageBloc,
      act: (bloc) => bloc.add(DataPageBlocEvent<String>(
          DataPageBlocEventType.changeFilterName, "")),
      expect: () => [isA<DataPageBlocAction>()],
    );

    blocTest<DataPageBloc, DataPageBlocAction>(
      'Test for continue event',
      build: () => _mockDataPageBloc,
      act: (bloc) => bloc.add(
          DataPageBlocEvent<dynamic>(DataPageBlocEventType.continueEvent, {})),
      expect: () => [isA<DataPageBlocAction>()],
    );
  });

  group('Service Tests', () {
    test("Test Service more data 2", () async {
      var result =
          await _mockServiceRepository.getCharacters(2, PaginationFilter());
      expect(result.results.length, 1);
    });
  });

  group('UI Tests', () {
    testWidgets('Continue to home page', (WidgetTester tester) async {
      await tester.pumpWidget(const MockMyApp());

      await tester.pumpAndSettle();

      expect(find.textContaining("Welcome"), findsOneWidget);
      expect(find.textContaining("All"), findsNothing);

      await tester.tap(find.byType(ButtonGlobal));
      await tester.pump();

      expect(find.textContaining("Welcome"), findsNothing);
      expect(find.textContaining("All"), findsOneWidget);
      mockNetworkImagesFor(() async => tester.pumpAndSettle());
    });
  });
}
