class ChatModel {
  final String chatId;
  final String name;
  final String idNumber;
  final String imageUrl;
  final String roleLabel;
  final bool pinned;
  final String lastMessage;
  final String updatedAt;

  ChatModel({
    required this.chatId,
    required this.name,
    required this.idNumber,
    required this.imageUrl,
    required this.roleLabel,
    required this.pinned,
    required this.lastMessage,
    required this.updatedAt,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      chatId: map['chatId'] ?? '',
      name: map['name'] ?? '',
      idNumber: map['idNumber'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      roleLabel: map['roleLabel'] ?? '',
      pinned: map['pinned'] ?? false,
      lastMessage: map['lastMessage'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'name': name,
      'idNumber': idNumber,
      'imageUrl': imageUrl,
      'roleLabel': roleLabel,
      'pinned': pinned,
      'lastMessage': lastMessage,
      'updatedAt': updatedAt,
    };
  }
}
