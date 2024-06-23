import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/chats_user/home_user.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/doctor_model.dart';
import 'package:graduate/services/cache_helper.dart';

// ignore: must_be_immutable
class CustomViewCardDoctor extends StatefulWidget {
  CustomViewCardDoctor({
    super.key,
    required this.user,
  });

  DoctorModel user;
  @override
  State<CustomViewCardDoctor> createState() => _CustomViewCardDoctorState();
}

class _CustomViewCardDoctorState extends State<CustomViewCardDoctor> {
  attachDoctor() async {
    int uId = CacheHelper.getDataId(key: 'id');
    try {
      var response = await Dio()
          .post('http://10.0.2.2:8000/api/userDoctors/attach', data: {
        'doctor_id': widget.user.id,
        'user_id': uId,
      });
      if (response.data["status"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Success 👀',
            desc: response.data["msg"],
            btnOk: Center(
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(baseColor)),
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // ignore: use_build_context_synchronously

                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
              ),
            )).show();
      } else if (!response.data["status"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Invalid Info ☠️',
          desc: response.data["msg"],
        ).show();
      }
    } catch (_) {}
    setState(() {});
  }

  createChat() async {
    int uId = CacheHelper.getDataId(key: 'id');
    try {
      var response = await Dio().post('http://10.0.2.2:8000/api/chats', data: {
        'doctor_id': widget.user.id,
        'user_id': uId,
      });
      if (response.data["status"]) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
            const HomeChatUser()
        ));
      } else if (!response.data['status']) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Invalid Info ☠️',
            desc: response.data["msg"],
          ).show();
          // ignore: use_build_context_synchronously
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
            const HomeChatUser()
        ));
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
          height: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: IconButton(
                        onPressed: () async {
                          await attachDoctor();
                        },
                        icon: const Icon(
                          Icons.add_circle_rounded,
                          size: 40,
                          color: baseColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: UserPhoto(isDoctor: true, ischat: false),
                    ),
                    IconButton(
                      onPressed: () async {
                        await createChat();
                      },
                      icon: const Icon(
                        Icons.messenger_outline_rounded,
                        size: 40,
                        color: baseColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
