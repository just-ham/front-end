import 'package:flutter/material.dart';
import 'package:just_ham/features/dilemma/message_data.dart';
import 'package:just_ham/features/dilemma/chat_bubble_message.dart';

class DilemmaScreen extends StatefulWidget {
  const DilemmaScreen({super.key});

  @override
  State<DilemmaScreen> createState() => _DilemmaScreenState();
}

class _DilemmaScreenState extends State<DilemmaScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = [
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        type: 0,
        senderUID: "senderUID"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('딜레마'),
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final beforeMessageUser = index == _messages.length - 1
                    ? null
                    : _messages[index + 1].sender;
                final beforeMessageTime = index == _messages.length - 1
                    ? null
                    : _messages[index + 1].sendAt;
                return Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: ChatBubbleMessage(
                    postId: "10", //widget.roomId.toString(),
                    userName: "asdf", //Token().userUniqId,
                    message: message,
                    beforeTime: beforeMessageTime,
                    beforeUser: beforeMessageUser,
                    imageSrc: ""
                    //ChatProfileProvider().getImageById(_messages[index].sender)
                    ,
                  ),
                );
              },
            ),
          ),
        ),
        //input text field and button in here
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 70,
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _messages.insert(
                        0,
                        Message(
                            room: "",
                            message: _textController.text,
                            sender: "sender",
                            sendAt: DateTime.now(),
                            type: 0,
                            senderUID: "senderUID"));
                    _textController.clear();
                    setState(() {});
                  },
                  child: const Text('Submit'),
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
