import 'package:flutter/material.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/models/doctor_model.dart';

// ignore: must_be_immutable
class CustomViewCardDoctorNotFollow extends StatefulWidget {
  CustomViewCardDoctorNotFollow({
    super.key,
    required this.user,
  });

  DoctorModel user;
  @override
  State<CustomViewCardDoctorNotFollow> createState() => _CustomViewCardDoctorNotFollowState();
}

class _CustomViewCardDoctorNotFollowState extends State<CustomViewCardDoctorNotFollow> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1.5,
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.user.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      child: UserPhoto(isDoctor: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
