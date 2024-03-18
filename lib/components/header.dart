// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  final String title;
  final Widget? rightSide;

  const Header(this.title, {super.key, required this.rightSide});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20.0),
          height: 54.0,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              color: Color.fromRGBO(117, 117, 117, 1),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // ignore: unnecessary_null_comparison
        (rightSide != null) ? rightSide! : Container()
      ],
    );
  }
}