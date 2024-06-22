import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduate/chats_user/home_user.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/doctor_model.dart';
import 'package:graduate/screens/doctors/view_users/get_all_doctors.dart';
import 'package:graduate/screens/users/show_doctors/custom_view_doctor.dart';
import 'package:graduate/screens/users/show_doctors/show_doctors.dart';

class SearchTr extends StatefulWidget {
  const SearchTr({super.key});

  @override
  State<SearchTr> createState() => _SearchTrState();
}

class _SearchTrState extends State<SearchTr> {
  List<DoctorModel> users = [];
  List<DoctorModel> searchResults = [];
  bool isLoading = true;
  String query = '';

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      users = await GetAllDoctors().getAllDoctors();
      setState(() {
        searchResults = users;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (kDebugMode) {
        print('Error fetching users: $e');
      }
    }
  }

  void onQueryChanged(String query) {
    setState(() {
      searchResults = users
          .where(
              (user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Header(
                'Search',
                rightSide: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeChatUser()
                        ),
                      );
                    },
                    child: UserPhoto(
                      isDoctor: true,
                      ischat: true,
                    ),
                  ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                      text: 'view all doctors',
                      onTab: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ViewAllDoctors(),
                        ));
                      },
                      color1: baseColor,
                      color2: baseColor,
                    ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  onChanged: (query) {
                    onQueryChanged(query);
                    setState(() {
                      this.query = query;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  autofocus: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : searchResults.isEmpty && query.isNotEmpty
                        ? const Center(child: Text('No results found'))
                        : Padding(
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
                        List<DoctorModel> users = searchResults;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: searchResults.length,
                          itemBuilder: (context, index) {
                            return CustomViewCardDoctor(user: users[index]);
                          },
                        );
                      } else {
                        return const Center(child: Text('No patients found'));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
