import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:rickandmorty/shared/models/DataModel.dart';

import 'CartoonCardText.dart';


class CartoonCard extends StatelessWidget {

  static const double RADIUS = 10;
  final Character character;

  const CartoonCard({
    Key? key,
    required this.character
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363,
      height: 200,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(RADIUS)),
        border: Border.all(width: 1, color: const Color(0xffB9B9B9))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(RADIUS),
                  bottomLeft: Radius.circular(RADIUS),
                ),
                image: DecorationImage(
                  image: Image.network(character.image).image,
                  fit: BoxFit.cover,
                  opacity: 1
                ),
              )
            ),
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
                    title: "${character.status} - ${character.species}",
                    value: character.name
                  ),
                  CartoonCardText(
                    title: "Last known location",
                    value: character.location.name
                  ),
                  CartoonCardText(
                    title: "First seen in",
                    value: character.created.toString()
                  )
                ]
              )
            )
          )
        ],
      )
    );
  }
}