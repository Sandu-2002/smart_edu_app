import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRemoteDataSource {
  final FirebaseFirestore firestore;
  FirestoreRemoteDataSource(this.firestore);

  Future<Map<String, dynamic>?> getDoc(String collection, String id) async {
    final doc = await firestore.collection(collection).doc(id).get();
    return doc.data();
  }

  Future<void> setDoc(
    String collection,
    String id,
    Map<String, dynamic> data,
  ) async {
    await firestore
        .collection(collection)
        .doc(id)
        .set(data, SetOptions(merge: true));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamCollection(
    String collection,
  ) {
    return firestore.collection(collection).snapshots();
  }
}
