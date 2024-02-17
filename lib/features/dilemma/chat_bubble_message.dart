import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:just_ham/features/dilemma/message_data.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';

Widget _buildTimeStamp(DateTime sendAt) {
  return Row(
    children: [
      Text(
        DateFormat('hh:mm a').format(sendAt),
        style: const TextStyle(color: Colors.grey, fontSize: 10),
      ),
    ],
  );
}

void showImage(BuildContext context, String imgSrc) {
  showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: 250,
            height: 450,
            alignment: Alignment.center,
            child: ExtendedImage.network(imgSrc, cache: true, fit: BoxFit.fill),
          ),
        );
      });
}

Widget _buildMessageBubble(BuildContext context, bool isSentByCurrentUser,
    Message message, String postId) {
  List<String> imgList = [];
  if (message.type == 1) {
    imgList = List<String>.from(jsonDecode(message.message));
  }

  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      if (isSentByCurrentUser) _buildTimeStamp(message.sendAt),
      message.type == 1
          ? Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
                maxHeight: 300,
              ),
              child: ListView.builder(
                itemCount: imgList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // imageNetworkListViewer(
                    //     imageUrls: imgList, context: context);
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExtendedImage.network(
                        imgList[index],
                        cache: true,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            )
          : ChatBubble(
              clipper: ChatBubbleClipper5(
                  type: isSentByCurrentUser
                      ? BubbleType.sendBubble
                      : BubbleType.receiverBubble),
              alignment:
                  isSentByCurrentUser ? Alignment.topRight : Alignment.topLeft,
              margin: const EdgeInsets.only(right: 4, left: 4),
              backGroundColor: isSentByCurrentUser ? Colors.blue : Colors.white,
              child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                    maxHeight: 300,
                  ),
                  child: SelectableText(
                    message.message,
                    style: TextStyle(
                        color:
                            isSentByCurrentUser ? Colors.white : Colors.black),
                  )),
            ),
      if (!isSentByCurrentUser) _buildTimeStamp(message.sendAt),
    ],
  );
}

class ChatBubbleMessage extends StatefulWidget {
  final String postId;
  final String userName;
  final Message message;
  final String? beforeUser;
  final DateTime? beforeTime;
  final List<XFile>? pickedImages;
  final String imageSrc;
  const ChatBubbleMessage(
      {super.key,
      required this.postId,
      required this.userName,
      required this.message,
      required this.imageSrc,
      this.beforeUser,
      this.beforeTime,
      this.pickedImages});

  @override
  State<ChatBubbleMessage> createState() => _ChatBubbleMessageState();
}

class _ChatBubbleMessageState extends State<ChatBubbleMessage> {
  @override
  Widget build(BuildContext context) {
    //logger.d("beforeUser : ${widget.beforeUser}, beforeTime : ${widget.userName},userName : ${widget.message.sender}");
    bool isSentByCurrentUser = widget.userName == widget.message.sender;
    if (widget.message.type == 2) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.beforeTime == null ||
                widget.message.sendAt.difference(widget.beforeTime!).inDays > 0)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  DateFormat('hh:mm a').format(widget.message.sendAt),
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            Text(
              "${"사용자b" ?? widget.message.sender} ${"chat_room_enter".tr()}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }
    if (widget.message.type == 3) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.beforeTime == null ||
                widget.message.sendAt.difference(widget.beforeTime!).inDays > 0)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  DateFormat().format(widget.message.sendAt),
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            Text(
              "${"사용자a" ?? widget.message.sender} ${"chat_room_leave".tr()}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
        if (widget.beforeTime == null ||
            widget.message.sendAt.difference(widget.beforeTime!).inDays > 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  DateFormat().format(widget.message.sendAt),
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ],
          ),
        Padding(
          padding: widget.userName == widget.beforeUser
              ? const EdgeInsets.only(top: 2)
              : const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: isSentByCurrentUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isSentByCurrentUser &&
                  widget.message.sender != widget.beforeUser)
                GestureDetector(
                  onTap: () {
                    // logger.d("profileOther/${widget.message.sender}");
                    context.push("/profileOther/${widget.message.sender}");
                  },
                  child: CircleAvatar(
                      radius: 15,
                      backgroundImage: ExtendedNetworkImageProvider(
                        "https://thumb.mt.co.kr/06/2023/11/2023111718453086374_1.jpg/dims/optimize/",
                        cache: true,
                      )),
                ),
              if (!isSentByCurrentUser &&
                  widget.message.sender == widget.beforeUser)
                const SizedBox(
                  width: 32,
                ),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.message.sender != widget.beforeUser &&
                      !isSentByCurrentUser)
                    Text(
                      "사용자1" ?? widget.message.sender,
                    ),
                  _buildMessageBubble(context, isSentByCurrentUser,
                      widget.message, widget.postId),
                  const SizedBox(height: 3),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
