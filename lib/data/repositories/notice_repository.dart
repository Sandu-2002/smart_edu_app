import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeRepository {
  final FirebaseFirestore firestore;
  NoticeRepository(this.firestore);

  Stream<QuerySnapshot<Map<String, dynamic>>> notices() =>
      firestore.collection('notices').snapshots();
}
