import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key, required this.value, required this.day, required this.name, required this.repsvalue});

  final double value;
  final String day;
  final String name;
  final int repsvalue;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .7,
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 15,
                      color: baseColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Reps complete  \n     $repsvalue/10',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                            strokeAlign: .8,
                            strokeCap: StrokeCap.round,
                            strokeWidth: 12,
                            backgroundColor: backGround,
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(baseColor),
                            value: value),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                 Text(
                  name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
