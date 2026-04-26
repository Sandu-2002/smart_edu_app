import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/attendance_model.dart';
import '../models/grade_model.dart';
import '../models/teacher_model.dart';

class TeacherRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TeacherRepository(FirebaseFirestore firestore);

  Future<TeacherModel?> getTeacherByUid(String uid) async {
    final doc = await firestore.collection('teachers').doc(uid).get();
    if (!doc.exists || doc.data() == null) return null;
    return TeacherModel.fromMap(doc.data()!);
  }

  Future<void> updateTeacher(TeacherModel teacher) async {
    await firestore
        .collection('teachers')
        .doc(teacher.uid)
        .set(teacher.toMap());
  }

  Future<void> saveAttendance(AttendanceModel attendance) async {
    await firestore
        .collection('attendance')
        .doc(attendance.attendanceId)
        .set(attendance.toMap());
  }

  Future<void> saveGrade(GradeModel grade) async {
    await firestore.collection('grades').doc(grade.gradeId).set(grade.toMap());
  }
}
