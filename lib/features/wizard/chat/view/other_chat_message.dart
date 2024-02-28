import 'package:flutter/material.dart';

class OtherChatMsg extends StatelessWidget {
  final String userName;
  final String content;
  final Animation<double> animation;

  const OtherChatMsg(
    this.userName,
    this.content,
    this.animation,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      //사이즈가 커지는 애니메이션 위젯
      child: SizeTransition(
        sizeFactor: animation,
        axisAlignment: -1.0,
        child: FadeTransition(
          opacity: animation,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(userName[0]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(content),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}