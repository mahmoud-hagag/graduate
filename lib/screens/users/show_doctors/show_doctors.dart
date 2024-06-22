import 'package:flutter/material.dart';
import 'package:graduate/models/doctor_model.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/doctors/view_users/get_all_doctors.dart';
import 'package:graduate/screens/users/show_doctors/custom_view_doctor.dart';
import 'package:graduate/screens/users/show_doctors/custom_view_doctor_not_follow.dart';
import 'package:graduate/services/cache_helper.dart';

class ViewAllDoctors extends StatefulWidget {
  const ViewAllDoctors({super.key});

  @override
  State<ViewAllDoctors> createState() => _ViewAllDoctorsState();
}

class _ViewAllDoctorsState extends State<ViewAllDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Header(
                  'doctors',
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
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: FutureBuilder<List<DoctorModel>>(
                    future: GetAllDoctors().getAllDoctors(),
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
                        List<DoctorModel> users = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return CacheHelper.getDataD(isDo: 'isD') == 'user'
                                ? CustomViewCardDoctor(user: users[index])
                                : CustomViewCardDoctorNotFollow(user: users[index]);
                          },
                        );
                      } else {
                        return const Center(child: Text('No patients found'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
