import 'package:flutter/material.dart';

import '../data_page/DataPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_back.png"),
              fit: BoxFit.cover,
              opacity: 0.65
            ),
          ),
          child: const DataPage()
        ),
      ),
    );
  }
}