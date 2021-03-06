import 'package:flutter/material.dart';

class LogoGlobal extends StatelessWidget {
  final double maxWidth;

  const LogoGlobal({Key? key, this.maxWidth = 500}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: maxWidth),
        child: Image.asset("assets/images/logo.png"));
  }
}
