import 'package:flutter/material.dart';
import 'package:rickandmorty/home_page/HomePage.dart';
import 'package:rickandmorty/StartApp.dart';

enum ENV { PROD, TEST }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final ENV env;
  const MyApp({Key? key, this.env = ENV.PROD}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (env == ENV.PROD) {
      StartApp.registers(context);
    }
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
