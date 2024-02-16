import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../state/chat_state.dart';
import '../view/my_chat_message.dart';
import '../view/other_chat_message.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState());

  void onButtonPress(){
    String txt = state.textEditingController.text;

    if(txt != ""){
      Logger().d(txt);

      state.textEditingController.clear();
      state.chats.insert(0, txt);
      state.myChat.insert(0, true);
      state.statusKey.currentState?.insertItem(0);
      state.socket.emit('chatMessage', txt);
    }
  }

  void chatInsert(String data) {
    state.chats.insert(0, data);
    state.myChat.insert(0, false);
    state.statusKey.currentState?.insertItem(0);
  }

  void sokectEventSetting(BuildContext context){
    //소켓 연결시 함수
    state.socket.onConnect((_) {
      Logger().d('Connected to server');
    });

    //소켓 종료시 함수
    state.socket.onDisconnect((_) {
      Logger().d('Disconnected from server');
    });

    //소켓 에러시 함수
    state.socket.onError((error) {
      Logger().e('Error: $error');
    });

    state.socket.connect();
    state.socket.on('chatMessage', (data) {
      // 메세지 감지
      Logger().d('Received message: $data');
      chatInsert(data);
    });
  }

  Widget onSubmitAnimation(BuildContext context, int index, Animation<double> animation){
    if(state.myChat[index]) {
      return MyChatMsg("나", state.chats[index], animation);
    } else {
      return OtherChatMsg("상담사", state.chats[index], animation);
    }
  }

  TextEditingController getChatMessage() {
    return state.textEditingController;
  }

  GlobalKey<AnimatedListState> getStatusKey() {
    return state.statusKey;
  }
}