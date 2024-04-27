import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mahmoud'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone_enabled_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: [
          Expanded(
              child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Container(
              width: 100,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10, top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Colors.grey[400],
              ),
              child: const Text('how are  you?'),
            ),
          )),
          const Divider(),
          Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Row(children: [
                Expanded(
                    child: TextField(
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => (),
                  decoration:
                      const InputDecoration.collapsed(hintText: "Type your message"),
                )),
                IconButton(icon: const Icon(Icons.send), onPressed: () {})
              ]))
        ]),
      ),
    );
  }
}
