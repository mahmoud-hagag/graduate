import 'package:flutter/material.dart';
import 'package:graduate/chats_user/chat_card_user.dart';
import 'package:graduate/chats_user/get_user_chats.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/user_chat_model.dart';
import 'package:graduate/services/cache_helper.dart';

class HomeChatUser extends StatefulWidget {
  const HomeChatUser({super.key});

  @override
  State<HomeChatUser> createState() => _HomeChatUserState();
}

class _HomeChatUserState extends State<HomeChatUser> {
  @override
  Widget build(BuildContext context) {
    
  final int iD = CacheHelper.getDataId(key: 'id');
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Header(
                  'chats',
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
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: FutureBuilder<List<UserChatModel>>(
                    future: GetUserChats().getUserChats(iD),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 600),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        Future.delayed(const Duration(seconds: 2));
                        List<UserChatModel> userChats = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: userChats.length,
                          itemBuilder: (context, index) {
                            return ChatCardUser(doctor: userChats[index],);
                          },
                        );
                      } else {
                        return const Center(child: Text('No patients found'));
                      }
                    },
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
