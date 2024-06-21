import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/search_text.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/models/user_model.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';
import 'package:graduate/screens/doctors/view_users/get_all_users.dart';

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
          .where((user) =>
              user.name.toLowerCase().contains(query.toLowerCase()))
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
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => NavBarDo(
                          currentIndex: 4,
                        ),
                      ),
                      (route) => false,
                    );
                  },
                  child: UserPhoto(
                    isDoctor: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
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
                        : ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: SearchText(user: searchResults[index]),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
