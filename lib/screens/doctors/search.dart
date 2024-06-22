import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/user_model.dart';
import 'package:graduate/screens/chats/home_doctor.dart';
import 'package:graduate/screens/doctors/view_users/custom_view_user.dart';
import 'package:graduate/screens/doctors/view_users/get_all_users.dart';
import 'package:graduate/screens/doctors/view_users/view_patients.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<UserModel> users = [];
  List<UserModel> searchResults = [];
  bool isLoading = true;
  String query = '';

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      users = await GetAllUsers().getAllUsers();
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
                          builder: (context) => const HomeChatDoctor()
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
                      text: 'view all users',
                      onTab: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ViewAllPatients(),
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
                        List<UserModel> users = searchResults;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: searchResults.length,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
