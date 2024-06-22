
class MessageModel {
  dynamic id;
  dynamic chatId;
  dynamic senderId;
  dynamic receiverId;
  dynamic content;
  dynamic image;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.content,
    this.image,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json['id'] ,
        chatId: json['chat_id'] ,
        senderId: json['sender_id'] ,
        receiverId: json['receiver_id'] ,
        content: json['content'] ,
        image: json['image'] ,
      );
}
