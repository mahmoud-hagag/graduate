
import 'package:dio/dio.dart';
import 'package:graduate/models/user_chat_model.dart';

class GetUserChats {
  Future<List<UserChatModel>>? getUserChats(int idU) async {
    Future.delayed(const Duration(seconds: 2));
    var response = await Dio().get(
      'http://10.0.2.2:8000/api/user-chats',
      data: {
        'user_id': idU,
      }
    );
    List<dynamic> data = response.data;
    List<UserChatModel> chats = [];
    for (int i = 0; i < data.length; i++) {
      chats.add(
        UserChatModel.fromJson(data[i]),
      );
    }
    return chats;
  }
}