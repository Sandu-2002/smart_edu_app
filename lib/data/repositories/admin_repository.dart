import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notice_model.dart';
import '../models/parent_model.dart';
import '../models/student_model.dart';
import '../models/teacher_model.dart';

class AdminRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  AdminRepository(FirebaseFirestore firestore);

  Future<void> addStudent(StudentModel student) async {
    await firestore
        .collection('students')
        .doc(student.uid)
        .set(student.toMap());
  }

  Future<void> addParent(ParentModel parent) async {
    await firestore.collection('parents').doc(parent.uid).set(parent.toMap());
  }

  Future<void> addTeacher(TeacherModel teacher) async {
    await firestore
        .collection('teachers')
        .doc(teacher.uid)
        .set(teacher.toMap());
  }

  Future<void> postNotice(NoticeModel notice) async {
    await firestore
        .collection('notices')
        .doc(notice.noticeId)
        .set(notice.toMap());
  }

  Future<int> getStudentCount() async {
    final query = await firestore.collection('students').get();
    return query.docs.length;
  }

  Future<int> getTeacherCount() async {
    final query = await firestore.collection('teachers').get();
    return query.docs.length;
  }

  Future<int> getNoticeCount() async {
    final query = await firestore.collection('notices').get();
    return query.docs.length;
  }
}
