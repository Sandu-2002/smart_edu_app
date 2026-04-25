import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';

class ChatRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ChatRepository(FirebaseFirestore firestore);

  Future<List<ChatModel>> getChats() async {
    final query = await firestore.collection('chats').get();
    return query.docs.map((doc) => ChatModel.fromMap(doc.data())).toList();
  }

  /// Stream for chats
  Stream<QuerySnapshot<Map<String, dynamic>>> chats() =>
      firestore.collection('chats').snapshots();

  Future<List<MessageModel>> getMessages(String chatId) async {
    final query = await firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('sentAt')
        .get();

    return query.docs.map((doc) => MessageModel.fromMap(doc.data())).toList();
  }

  Future<void> sendMessage(String chatId, MessageModel messageModel) async {
    await firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageModel.messageId)
        .set(messageModel.toMap());

    await firestore.collection('chats').doc(chatId).set({
      'chatId': chatId,
      'lastMessage': messageModel.message,
      'updatedAt': messageModel.sentAt,
    }, SetOptions(merge: true));
  }
}
