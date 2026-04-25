class MessageModel {
  final String messageId;
  final String senderId;
  final String receiverId;
  final String message;
  final String sentAt;

  MessageModel({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.sentAt,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageId: map['messageId'] ?? '',
      senderId: map['senderId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      message: map['message'] ?? '',
      sentAt: map['sentAt'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'sentAt': sentAt,
    };
  }
}
