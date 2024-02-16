import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../chat.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    //웹소켓 연결
    context.read<ChatCubit>().sokectEventSetting(context);

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("상담사 채팅"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: context.read<ChatCubit>().getStatusKey(),
              itemBuilder : context.read<ChatCubit>().onSubmitAnimation,
              reverse: true,
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: context.read<ChatCubit>().getChatMessage(),
                      decoration: const InputDecoration(
                        hintText: "채팅을 입력하세요.",
                      ),
                      onSubmitted: (String text){
                        context.read<ChatCubit>().onButtonPress();
                      },
                    )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: (){
                      context.read<ChatCubit>().onButtonPress();
                    },
                    child: const Text('전송'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}