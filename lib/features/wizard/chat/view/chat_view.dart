import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_ham/config/theme/app_color.dart';
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
        backgroundColor: ColorStyles.mainColor,
      ),
      body: Container(
        //배경 색상 그라데이션 표시
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorStyles.mainColor,
              ColorStyles.secondMainColor,
            ]
          )
        ),
        //채팅이 올라오는 화면과 채팅을 치는 텍스트 필드 전송 버튼 묶음 컬럼
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: AnimatedList(
                  key: context.read<ChatCubit>().getStatusKey(),
                  itemBuilder : context.read<ChatCubit>().onSubmitAnimation,
                  reverse: true,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                //채팅을 치는 텍스트 필드, 전송 버튼 구분 로우
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
                        backgroundColor: ColorStyles.mainColor,
                        foregroundColor: Colors.white,
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
      ),
    );
  }
}