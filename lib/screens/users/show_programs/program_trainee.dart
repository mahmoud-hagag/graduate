import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/programs_model.dart';
import 'package:graduate/screens/users/exercise.dart';
import 'package:graduate/screens/users/programs.dart';
import 'package:graduate/screens/users/show_programs/custom_program_user_card.dart';
import 'package:graduate/screens/users/show_programs/get_user_programs.dart';
import 'package:graduate/screens/users/tab_bar_trainee.dart';
import 'package:graduate/services/cache_helper.dart';

class ProgramTr extends StatefulWidget {
  const ProgramTr({super.key});

  @override
  State<ProgramTr> createState() => _ProgramTrState();
}

class _ProgramTrState extends State<ProgramTr> {
  final int iD = CacheHelper.getDataId(key: 'id');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Header(
                  'Programs',
                  rightSide: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => NavBarTR(
                            currentIndex: 4,
                          ),
                        ),
                        (route) => false,
                      );
                    },
                    child: UserPhoto(
                      isDoctor: false,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('overall progress:'),
                    Text('70%'),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        minHeight: 20,
                        backgroundColor: backGround,
                        valueColor: AlwaysStoppedAnimation<Color>(baseColor),
                        value: .7,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Plans',
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    CustomButton(
                      text: 'exercise',
                      onTab: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ExerciseTr(),
                        ));
                      },
                      color1: baseColor,
                      color2: baseColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                            return CustomProgramUserCard(program: userProgram[index],);
                          },
                        );
                      } else {
                        return const Center(child: Text('No patients found'));
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: 'program',
                      onTab: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Programs(),
                        ));
                      },
                      color1: baseColor,
                      color2: baseColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
