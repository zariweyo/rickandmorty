// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:rickandmorty/shared/UI/index.dart';

import 'package:rickandmorty/shared/repository/index.dart';
import 'package:http/http.dart' as http;
import 'mock_my_app.dart';
import 'mock_start_app.dart';

class MockBuildContext extends Mock implements BuildContext {}

@GenerateMocks([http.Client])
void main() {
  late MockBuildContext _mockContext;
  late ServiceRepository _mockServiceRepository;
  late DataPageBloc _mockDataPageBloc;

  setUpAll(() {
    _mockContext = MockBuildContext();
    MockStartApp.registers(_mockContext);
    _mockServiceRepository = GetIt.I.get<ServiceRepository>();
  });

  setUp((){
    _mockDataPageBloc = DataPageBloc(DataPageBlocAction<BuildContext>(DataPageBlocActionType.initial,_mockContext));
  });


  group('Bloc Tests', () {
    blocTest<DataPageBloc, DataPageBlocAction>(
        'Test for change filter name',
        build: () => _mockDataPageBloc,
        act: (bloc) => bloc.add(DataPageBlocEvent<String>(DataPageBlocEventType.changeFilterName,"")),
        expect: () => [isA<DataPageBlocAction>()],
    );

    blocTest<DataPageBloc, DataPageBlocAction>(
        'Test for continue event',
        build: () => _mockDataPageBloc,
        act: (bloc) => bloc.add(DataPageBlocEvent<dynamic>(DataPageBlocEventType.continueEvent,{})),
        expect: () => [isA<DataPageBlocAction>()],
    );
  });

  group('Service Tests', () {
    test("Test Service more data 2", () async {
      var result = await _mockServiceRepository.getNextCharacters("https://rickandmortyapi.com/api/character");
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
      mockNetworkImagesFor(() async =>
        tester.pumpAndSettle()
      );
    });
  });
}
