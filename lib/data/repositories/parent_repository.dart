import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/parent_model.dart';
import '../models/result_model.dart';

class ParentRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ParentRepository(FirebaseFirestore firestore);

  Future<ParentModel?> getParentByUid(String uid) async {
    final doc = await firestore.collection('parents').doc(uid).get();
    if (!doc.exists || doc.data() == null) return null;
    return ParentModel.fromMap(doc.data()!);
  }

  Future<List<ResultModel>> getResultsByStudentId(String studentId) async {
    final query = await firestore
        .collection('results')
        .where('studentId', isEqualTo: studentId)
        .get();

    return query.docs.map((doc) => ResultModel.fromMap(doc.data())).toList();
  }

  Future<void> updateParent(ParentModel parent) async {
    await firestore.collection('parents').doc(parent.uid).set(parent.toMap());
  }
}
