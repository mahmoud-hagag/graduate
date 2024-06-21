import 'package:flutter/material.dart';
import 'package:graduate/screens/doctors/view_users/custom_view_user.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/user_model.dart';
import 'package:graduate/screens/doctors/view_users/get_all_users.dart';

class ViewAllPatients extends StatefulWidget {
  const ViewAllPatients({super.key});

  @override
  State<ViewAllPatients> createState() => _ViewAllPatientsState();
}

class _ViewAllPatientsState extends State<ViewAllPatients> {
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
                  'users',
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
                  child: FutureBuilder<List<UserModel>>(
                    future: GetAllUsers().getAllUsers(),
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
                        List<UserModel> users = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return CustomViewCard(user: users[index]);
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
