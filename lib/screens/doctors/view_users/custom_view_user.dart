import 'package:flutter/material.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/models/user_model.dart';
import 'package:graduate/screens/doctors/programs/attach_prgram.dart';

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1.5,
        child: SizedBox(
          width: double.infinity,
          height: 200,
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
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
                            builder: (context) =>AttachProgram(
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
                height: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
