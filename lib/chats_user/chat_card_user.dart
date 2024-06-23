import 'package:flutter/material.dart';
import 'package:graduate/chats_user/chat_page_user.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/models/user_chat_model.dart';

// ignore: must_be_immutable
class ChatCardUser extends StatefulWidget {
  ChatCardUser({super.key, required this.doctor});

  UserChatModel doctor;

  @override
  State<ChatCardUser> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCardUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatPageUser(userChat: widget.doctor),
          ));
        },
        child: Card(
          elevation: 1.5,
          child: SizedBox(
            width: double.infinity,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          widget.doctor.doctor.name,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: UserPhoto(
                          isDoctor: true,
                          ischat: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
