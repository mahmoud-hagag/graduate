import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';

class Helps extends StatelessWidget {
  const Helps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Header(
                'Helps',
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
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'This app helps you as a doctor to help the patients and contact with them .\n\n you can add programs to a patient \n\n you can watch your patient progress ',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
