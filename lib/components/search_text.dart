import 'package:flutter/material.dart';
import 'package:graduate/models/user_model.dart';

// ignore: must_be_immutable
class SearchText extends StatelessWidget {
  SearchText({super.key,required this.user});

  UserModel user;
  @override
  Widget build(BuildContext context) {
    return Text(user.name);
  }
}
