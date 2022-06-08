import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/shared/UI/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            Text(
              AppLocalizations.of(context)!.welcomeToApp,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.03),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                AppLocalizations.of(context)!.welcomeToAppBody,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.26),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: ButtonGlobal(
                    text: AppLocalizations.of(context)!.continueToNext,
                    onTap: () => BlocProvider.of<DataPageBloc>(context).add(
                        DataPageBlocEvent<dynamic>(
                            DataPageBlocEventType.continueEvent, {}))))
          ])),
    );
  }
}
