import 'package:flutter/material.dart';
import 'package:rickandmorty/home_page/home_page.dart';
import 'package:rickandmorty/start_app.dart';

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
      home: const HomePage(),
    );
  }
}
