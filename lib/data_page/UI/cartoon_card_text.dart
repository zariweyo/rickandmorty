import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CartoonCardText extends StatelessWidget {
  final String title;
  final String value;

  const CartoonCardText({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 3),
        height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: AutoSizeText(title,
                    maxLines: 1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xff515151)))),
            Expanded(
                flex: 3,
                child: AutoSizeText(value,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 15)))
          ],
        ));
  }
}
