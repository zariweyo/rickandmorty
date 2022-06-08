import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/shared/UI/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';

class DataScreenHome extends StatelessWidget {
  const DataScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Align(alignment: Alignment.center, child: SquadLogoGlobal()),
            const Align(alignment: Alignment.center, child: LogoGlobal()),
            const Text(
              "Bienvenido a Rick and Morty",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.03),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "En esta prueba, evaluaremos su capacidad para construit la aplicación mediante el análisis de código y la reproducción del siquiente diseño.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.26),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: ButtonGlobal(
                    text: "Continuar",
                    onTap: () => BlocProvider.of<DataPageBloc>(context).add(
                        DataPageBlocEvent<dynamic>(
                            DataPageBlocEventType.continueEvent, {}))))
          ])),
    );
  }
}
