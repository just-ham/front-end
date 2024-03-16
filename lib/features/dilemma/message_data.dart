class Message {
  final String room;
  final String message;
  final String sender;
  final DateTime sendAt;
  final int type;
  final String senderUID;
  final bool isFirstSide;

  Message(
      {required this.room,
      required this.message,
      required this.sender,
      required this.sendAt,
      required this.type,
      required this.isFirstSide,
      required this.senderUID});

  factory Message.fromJson(Map<String, dynamic> message) {
    return Message(
      room: message['room'],
      message: message['message'],
      sender: message['sender'],
      type: message['type'],
      senderUID: message["_id"],
      isFirstSide: message['isFirstSide'],
      sendAt: DateTime.fromMillisecondsSinceEpoch(message['sendAt']),
    );
  }
}
