import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/program_card.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/programs_model.dart';
import 'package:graduate/screens/users/show_programs/custom_progress_program_user_card.dart';
import 'package:graduate/screens/users/show_programs/get_user_programs.dart';
import 'package:graduate/services/cache_helper.dart';

class ProgramsDetails extends StatefulWidget {
  const ProgramsDetails({super.key});

  @override
  State<ProgramsDetails> createState() => _ProgramsDetailsState();
}

class _ProgramsDetailsState extends State<ProgramsDetails> {
  
  final int iD = CacheHelper.getDataId(key: 'id');
  TextEditingController day = TextEditingController();
  bool isSelectedG = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  'Programs Details',
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
                Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: FutureBuilder<List<ProgramModel>>(
                      future: GetProgramUser().getProgramUser(iD),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 600),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          Future.delayed(const Duration(seconds: 2));
                          List<ProgramModel> userProgram = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: userProgram.length,
                            itemBuilder: (context, index) {
                              return CustomProgressProgramUserCard(program: userProgram[index],);
                            },
                          );
                        } else {
                          return const Center(child: Text('No patients found'));
                        }
                      },
                    ),
                  ),
                const ProgramCard(
                  day: 'saterday',
                  name: 'Push Up',
                  repsvalue: 10,
                  value: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ProgramCard(
                  day: 'sunday',
                  name: 'Push Up',
                  repsvalue: 7,
                  value: .7,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ProgramCard(
                  day: 'monday',
                  name: 'Deadlift',
                  repsvalue: 3,
                  value: .3,
                ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
