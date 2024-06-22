
import 'package:dio/dio.dart';
import 'package:graduate/models/docror_chat_model.dart';

class GetDoctorChats {
  Future<List<DoctorChatModel>>? getUserChats(int idU) async {
    Future.delayed(const Duration(seconds: 2));
    var response = await Dio().get(
      'http://10.0.2.2:8000/api/user-chats',
      data: {
        'user_id': idU,
      }
    );
    List<dynamic> data = response.data;
    List<DoctorChatModel> chats = [];
    for (int i = 0; i < data.length; i++) {
      chats.add(
        DoctorChatModel.fromJson(data[i]),
      );
    }
    return chats;
  }
}