import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduate/chats_user/get_messages_chat.dart';
import 'package:graduate/chats_user/message_left.dart';
import 'package:graduate/chats_user/message_right.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/models/docror_chat_model.dart';
import 'package:graduate/models/messge_model.dart';
import 'package:graduate/services/cache_helper.dart';

// ignore: must_be_immutable
class ChatPageDoctor extends StatefulWidget {
  ChatPageDoctor({super.key, required this.userChat});
  DoctorChatModel userChat;
  @override
  State<ChatPageDoctor> createState() => _ChatPageStateDoctor();
}

class _ChatPageStateDoctor extends State<ChatPageDoctor> {
  TextEditingController message = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  Future send() async {
    uId = CacheHelper.getData(key: 'uId');
    try {
      var response = await Dio().post(
        'http://10.0.2.2:8000/api/messages/send',
        data: {
          'chat_id': widget.userChat.id,
          'sender_id': widget.userChat.userId,
          'receiver_id': widget.userChat.doctorId,
          'content': message.text,
        },
        options: Options(
          validateStatus: (status) {
            return status! < 500; // Accept status codes less than 500
          },
        ),
      );

      if (response.statusCode == 302) {
        // Handle the redirection if needed
        if (kDebugMode) {
          print('Redirection detected. Handle accordingly.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Header(
                  widget.userChat.user.name,
                  rightSide: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      size: 35,
                      Icons.arrow_forward_ios_outlined,
                      color: baseColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: FutureBuilder<List<MessageModel>>(
                      future: GetChatMessages()
                          .getChatMessages(widget.userChat.user.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 600),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          Future.delayed(const Duration(seconds: 2));
                          List<MessageModel> userChats = snapshot.data!;
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _scrollToBottom();
                          });
                          return ListView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: userChats.length,
                            itemBuilder: (context, index) {
                              return widget.userChat.userId == iD
                                  ? MessageRight(
                                      message: userChats[index].content,
                                    )
                                  : MessageLefi(
                                      message: userChats[index].content);
                            },
                          );
                        } else {
                          return const Center(child: Text('No patients found'));
                        }
                      },
                    ),
                  ),
                ),
                const Divider(),
                Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).cardColor),
                    child: Row(children: [
                      Expanded(
                          child: TextField(
                        textInputAction: TextInputAction.send,
                        controller: message,
                        onSubmitted: (value) async {
                          if (!(message.text == '')) {
                            await send();
                            setState(() {});
                            message.text = '';
                          }
                        },
                        decoration: const InputDecoration.collapsed(
                            hintText: "Type your message"),
                      )),
                      IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () async {
                            if (!(message.text == '')) {
                              await send();
                              setState(() {});
                              message.text = '';
                            }
                          })
                    ]))
              ]),
        ),
      ),
    );
  }
}
