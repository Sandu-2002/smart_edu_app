import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student_model.dart';

class StudentRepository {
  final FirebaseFirestore firestore;
  StudentRepository(this.firestore);

  Future<StudentModel?> getStudentByUid(String uid) async {
    final doc = await firestore.collection('students').doc(uid).get();
    if (!doc.exists || doc.data() == null) return null;
    return StudentModel.fromMap(doc.data()!);
  }
}
