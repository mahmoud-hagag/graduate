import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';

class VerifyTr extends StatefulWidget {
  const VerifyTr({super.key});

  @override
  State<VerifyTr> createState() => _VerifyTrState();
}

class _VerifyTrState extends State<VerifyTr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Header(
                'Verfication',
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
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}