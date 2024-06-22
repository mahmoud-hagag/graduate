import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserPhoto extends StatelessWidget {
  UserPhoto({super.key, required this.isDoctor,required this.ischat});
  bool isDoctor;
  bool ischat;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54.0,
      height: 54.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ischat?'assets/chat.png':
            isDoctor ? 'assets/doctor.png' : 'assets/user.jpg',
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(360),
        ),
        color: const Color.fromARGB(255, 11, 119, 151),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 20.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
        border: Border.all(
          color: Colors.white,
          width: 4.0,
        ),
      ),
    );
  }
}
