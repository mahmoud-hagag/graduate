
import 'package:dio/dio.dart';
import 'package:graduate/models/messge_model.dart';

class GetChatMessages {
  Future<List<MessageModel>>? getChatMessages(int idU) async {
    Future.delayed(const Duration(seconds: 2));
    var response = await Dio().get(
      'http://10.0.2.2:8000/api/messages/',
      data: {
        'chat_id': idU,
      }
    );
    List<dynamic> data = response.data;
    List<MessageModel> messages = [];
    for (int i = 0; i < data.length; i++) {
      messages.add(
        MessageModel.fromJson(data[i]),
      );
    }
    return messages;
  }
}