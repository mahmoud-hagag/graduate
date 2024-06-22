import 'package:flutter/material.dart';
import 'package:graduate/models/doctor_model.dart';

// ignore: must_be_immutable
class SearchTextDoctor extends StatelessWidget {
  SearchTextDoctor({super.key,required this.doctor});

  DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return Text(doctor.name);
  }
}
