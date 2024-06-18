import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                'Progress',
                rightSide: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    size: 35,
                    Icons.arrow_forward_ios_outlined,
                    color: baseColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]
          ),
        ),
      ),
    );
  }
}
