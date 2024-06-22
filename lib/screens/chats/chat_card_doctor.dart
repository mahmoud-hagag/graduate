import 'package:flutter/material.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/models/docror_chat_model.dart';
import 'package:graduate/screens/chats/chat_page_doctor.dart';

// ignore: must_be_immutable
class ChatCardDoctor extends StatefulWidget {
  ChatCardDoctor({super.key,required this.doctor});

  DoctorChatModel doctor;

  @override
  State<ChatCardDoctor> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCardDoctor> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPageDoctor(userChat: widget.doctor),));

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
                          widget.doctor.user.name,
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
