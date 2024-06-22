import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/day_model.dart';
import 'package:graduate/screens/users/show_workouts/show_workouts.dart';

// ignore: must_be_immutable
class CustomProgramDaysCard extends StatefulWidget {
  CustomProgramDaysCard({
    super.key,
    required this.program,
  });

  DayModel program;
  @override
  State<CustomProgramDaysCard> createState() => _CustomProgramDaysCardState();
}

class _CustomProgramDaysCardState extends State<CustomProgramDaysCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ShowWorkouts(program: widget.program),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Card(
          elevation: .7,
          child: SizedBox(
            width: double.infinity,
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.program.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: baseColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
