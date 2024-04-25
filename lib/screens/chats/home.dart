import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/constants/colors.dart';

class HomeChat extends StatelessWidget {
  const HomeChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Header(
                  'messages',
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
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: (){},
                  child: const Card(
                    elevation: .4,
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              'DR. mohamed',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'can i talk to you ?',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              UserPhoto(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Card(
                  elevation: 1.5,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'fares',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Hi doctor !!',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            UserPhoto()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Card(
                  elevation: 3,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Eslam',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'this new challenge',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            UserPhoto()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Card(
                  elevation: 9,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Gellany',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Never give up',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            UserPhoto()
                          ],
                        ),
                      ],
                    ),
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