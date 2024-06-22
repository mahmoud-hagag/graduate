import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/day_model.dart';
import 'package:graduate/models/programs_model.dart';
import 'package:graduate/screens/users/show_days/get_pragram_days.dart';
import 'package:graduate/screens/users/show_days/show_progress_days.dart';

// ignore: must_be_immutable
class CustomProgressProgramUserCard extends StatefulWidget {
  CustomProgressProgramUserCard({
    super.key,
    required this.program,
  });

  ProgramModel program;
  @override
  State<CustomProgressProgramUserCard> createState() =>
      _CustomProgressProgramUserCardState();
}

class _CustomProgressProgramUserCardState
    extends State<CustomProgressProgramUserCard> {
  List<DayModel> days = [];
  fetchDays(int idP) async {
    GetProgramDays getProgramDays = GetProgramDays();
    List<DayModel>? days1 = await getProgramDays.getProgramDays(idP);
    return days1;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        days =await fetchDays(widget.program.id);
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ShowProgressDays(program: widget.program, days: days),
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
                        'Progress',
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
