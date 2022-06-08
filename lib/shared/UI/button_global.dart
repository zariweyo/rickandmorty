import 'package:flutter/material.dart';

class ButtonGlobal extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const ButtonGlobal({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        child: InkWell(
            onTap: onTap,
            child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff12555F),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.26),
                ))));
  }
}
