import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rickandmorty/home_page/home_page.dart';
import 'package:rickandmorty/shared/repository/index.dart';
import 'package:rickandmorty/start_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final ENV enviroment;
  const MyApp({Key? key, this.enviroment = ENV.prod}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    StartApp.registers(context, enviroment);
    
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
