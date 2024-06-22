import 'package:graduate/models/doctor_model.dart';

class UserChatModel {
  final int id;
  final int userId;
  final int doctorId;
  DoctorModel doctor;
  UserChatModel(
      {required this.userId, required this.doctorId, required this.id,required this.doctor});

  factory UserChatModel.fromJson(jsonData) {
    return UserChatModel(
      id: jsonData['id'],
      userId: jsonData['user_id'],
      doctorId: jsonData['doctor_id'],
      doctor: DoctorModel.fromJson(jsonData['doctor']),
    );
  }
}
