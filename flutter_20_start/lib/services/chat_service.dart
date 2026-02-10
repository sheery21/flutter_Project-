import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy("timeStamp", descending: true)
        .snapshots();
  }

  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String receiverId,
    required String text,
  }) async {
    final chatRef = _firestore.collection("chats").doc(chatId);
    await chatRef.collection("messages").add({
      "text": text,
      "senderId": senderId,
      "receiverId": receiverId,
      "timeStamp": FieldValue.serverTimestamp(),
    });
    await chatRef.set({
      "users": [senderId, receiverId],
      "lastMessage": text,
      "lastMessageSender": senderId,
      "lastMessageTime": FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
