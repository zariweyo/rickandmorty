import 'package:flutter/material.dart';

class SquadLogoGlobal extends StatelessWidget {

  const SquadLogoGlobal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 500),
        child: Image.asset("assets/images/squad_logo.png"));
  }
}
