import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ham/features/dilemma/message_data.dart';
import 'package:just_ham/features/dilemma/chat_bubble_message.dart';

class DilemmaScreen extends StatefulWidget {
  const DilemmaScreen({super.key, required this.catagory, required this.id});

  final String catagory;
  final String id;

  @override
  State<DilemmaScreen> createState() => _DilemmaScreenState();
}

class _DilemmaScreenState extends State<DilemmaScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isVoted = false;
  bool _isFirstSide = true;
  bool _isLogin = false;
  static const _PANEL_HEADER_HEIGHT = 0.0;

  bool get _isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = [
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        isFirstSide: true,
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        isFirstSide: true,
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        isFirstSide: false,
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        isFirstSide: false,
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        isFirstSide: false,
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        isFirstSide: false,
        type: 0,
        senderUID: "senderUID"),
    Message(
        room: "",
        message: "그냥",
        sender: "sender",
        sendAt: DateTime.now(),
        isFirstSide: true,
        type: 0,
        senderUID: "senderUID"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      value: 1.0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - _PANEL_HEADER_HEIGHT;
    final double bottom = -_PANEL_HEADER_HEIGHT;
    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Animation<RelativeRect> animation = _getPanelAnimation(constraints);
    final ThemeData theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: Stack(
        children: <Widget>[
          Center(
            child: Text("오늘의 딜레마 설명"),
          ),
          PositionedTransition(
            rect: animation,
            child: Material(
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0)),
              elevation: 12.0,
              child: Column(children: [
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
                        final isBeforeFirstSide = index == _messages.length - 1
                            ? null
                            : _messages[index + 1].isFirstSide;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8, left: 8),
                          child: ChatBubbleMessage(
                            postId: "10", //widget.roomId.toString(),
                            userName: "asdf", //Token().userUniqId,
                            message: message,
                            beforeTime: beforeMessageTime,
                            beforeUser: beforeMessageUser,
                            isFirstSide: message.isFirstSide,
                            isBeforeFirst: isBeforeFirstSide,
                            imageSrc: ""
                            //ChatProfileProvider().getImageById(_messages[index].sender)
                            ,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //투표 기능
                _isVoted
                    ? //input text field and button in here
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
                                          isFirstSide: _isFirstSide,
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
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_isLogin) {
                                      _isFirstSide = true;
                                      _isVoted = true;
                                      setState(() {});
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("로그인이 필요한 기능입니다."),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      _isLogin = true;
                                                      context.pop();
                                                    },
                                                    child: Text("확인"))
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  child: Text("1번 투표"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_isLogin) {
                                      _isFirstSide = false;
                                      _isVoted = true;
                                      setState(() {});
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("로그인이 필요한 기능입니다."),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      _isLogin = true;
                                                      context.pop();
                                                    },
                                                    child: Text("확인"))
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  child: Text("2번 투표"),
                                )
                              ],
                            )),
                      ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(
              onPressed: () {
                _controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
              },
              child: Text('딜레마')),
        ),
        body: LayoutBuilder(
          builder: _buildStack,
        ),
      ),
    );
  }
}
