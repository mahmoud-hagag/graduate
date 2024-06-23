import 'package:graduate/models/user_model.dart';

class DoctorChatModel {
  final int id;
  final int userId;
  final int doctorId;
  UserModel user;
  DoctorChatModel(
      {required this.userId, required this.doctorId, required this.id,required this.user});

  factory DoctorChatModel.fromJson(jsonData) {
    return DoctorChatModel(
      id: jsonData['id'],
      userId: jsonData['user_id'],
      doctorId: jsonData['doctor_id'],
      user: UserModel.fromJson(jsonData['user']),
    );
  }
}
