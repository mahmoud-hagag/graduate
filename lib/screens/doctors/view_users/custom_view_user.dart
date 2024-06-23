import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/user_model.dart';
import 'package:graduate/screens/chats/home_doctor.dart';
import 'package:graduate/screens/doctors/programs/attach_prgram.dart';
import 'package:graduate/services/cache_helper.dart';

// ignore: must_be_immutable
class CustomViewCard extends StatefulWidget {
  CustomViewCard({
    super.key,
    required this.user,
  });

  UserModel user;
  @override
  State<CustomViewCard> createState() => _CustomViewCardState();
}

class _CustomViewCardState extends State<CustomViewCard> {
  createChat() async {
    int uId = CacheHelper.getDataId(key: 'id');
    try {
      var response = await Dio().post('http://10.0.2.2:8000/api/chats', data: {
        'doctor_id': uId ,
        'user_id': widget.user.id,
      });
      if (response.data["status"]) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
            const HomeChatDoctor()
        ));
      } else if (!response.data['status']) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Invalid Info ☠️',
            desc: response.data["msg"],
            onDismissCallback: (type) {
               Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
            const HomeChatDoctor()
        ));
            },
          ).show();
         
      }
    } catch (_) {}
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1.5,
        child: SizedBox(
          width: double.infinity,
          height: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.user.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UserPhoto(
                      isDoctor: false,
                      ischat: false,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Programs',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AttachProgram(
                              user: widget.user,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.pix_rounded, size: 40),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'chating',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: IconButton(
                      onPressed: ()  async {
                        await createChat();
                      },
                      icon: const Icon(
                        Icons.messenger_outline_rounded,
                        size: 40,
                        color: baseColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
