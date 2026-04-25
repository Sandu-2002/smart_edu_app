import 'package:cloud_firestore/cloud_firestore.dart';

class ResultRepository {
  final FirebaseFirestore firestore;
  ResultRepository(this.firestore);

  Stream<QuerySnapshot<Map<String, dynamic>>> results() =>
      firestore.collection('results').snapshots();
}
