import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rickandmorty/domain/models/list/character_model.dart';

import 'cartoon_card_text.dart';

class CartoonCard extends StatelessWidget {
  static const double defRadius = 10;
  final Character character;

  const CartoonCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 363,
        height: 200,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(defRadius)),
            border: Border.all(width: 1, color: const Color(0xffB9B9B9))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(defRadius),
                  bottomLeft: Radius.circular(defRadius),
                ),
                image: DecorationImage(
                    image: Image.network(character.image).image,
                    fit: BoxFit.cover,
                    opacity: 1),
              )),
            ),
            Expanded(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CartoonCardText(
                              title:
                                  "${character.status} - ${character.species}",
                              value: character.name),
                          CartoonCardText(
                              title: AppLocalizations.of(context)!
                                  .lastKnowLocation,
                              value: character.location!.name),
                          CartoonCardText(
                              title: AppLocalizations.of(context)!.firstSeenIn,
                              value: character.episode.first.airDate!
                                      .toIso8601String()
                                      .split("T")[0] +
                                  " " +
                                  character.episode.first.name.toString())
                        ])))
          ],
        ));
  }
}
