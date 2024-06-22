import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';

// ignore: must_be_immutable
class MessageRight extends StatelessWidget {
  MessageRight({super.key,required this.message});

  String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20,bottom: 20),
      margin: const EdgeInsets.only(right: 100, top: 16),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(message, style: const TextStyle(color: Colors.white))),
    );
  }
}