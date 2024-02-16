import 'package:flutter/material.dart';

class MyChatMsg extends StatelessWidget {
  final String userName;
  final String content;
  final Animation<double> animation;

  const MyChatMsg(
    this.userName,
    this.content,
    this.animation,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: SizeTransition(
        sizeFactor: animation,
        axisAlignment: -1.0,
        child: FadeTransition(
          opacity: animation,
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(userName),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Text(content),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16,),
              CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(userName[0]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}