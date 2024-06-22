class ChatModel {
  final int id;
  final String userId;
  final String doctorId;
  ChatModel({required this.userId,  required this.doctorId, required this.id});

  factory ChatModel.fromJson(jsonData) {
    return ChatModel(
      id: jsonData['id'], userId: jsonData['user_id'],
      doctorId: jsonData['doctor_id'],
    );
  }
}