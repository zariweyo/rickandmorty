import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rickandmorty/home_page/home_page.dart';
import 'package:rickandmorty/start_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ENV { prod, test }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final ENV env;
  const MyApp({Key? key, this.env = ENV.prod}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (env == ENV.prod) {
      StartApp.registers(context);
    }
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      home: const HomePage(),
    );
  }
}
