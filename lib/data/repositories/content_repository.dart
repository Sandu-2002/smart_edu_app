import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/course_model.dart';
import '../models/notice_model.dart';
import '../models/schedule_model.dart';

class ContentRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ContentRepository(FirebaseFirestore firestore);

  Future<List<CourseModel>> getCourses() async {
    final query = await firestore.collection('courses').get();
    return query.docs.map((doc) => CourseModel.fromMap(doc.data())).toList();
  }

  Future<List<ScheduleModel>> getSchedules() async {
    final query = await firestore.collection('schedules').get();
    return query.docs.map((doc) => ScheduleModel.fromMap(doc.data())).toList();
  }

  Future<List<NoticeModel>> getNotices() async {
    final query = await firestore.collection('notices').get();
    return query.docs.map((doc) => NoticeModel.fromMap(doc.data())).toList();
  }

  /// Stream for short notes
  Stream<QuerySnapshot<Map<String, dynamic>>> shortNotes() =>
      firestore.collection('shortNotes').snapshots();

  /// Stream for guide books
  Stream<QuerySnapshot<Map<String, dynamic>>> guideBooks() =>
      firestore.collection('guideBooks').snapshots();

  /// Stream for courses
  Stream<QuerySnapshot<Map<String, dynamic>>> courses() =>
      firestore.collection('courses').snapshots();

  /// Stream for results
  Stream<QuerySnapshot<Map<String, dynamic>>> results() =>
      firestore.collection('results').snapshots();

  /// Stream for notices
  Stream<QuerySnapshot<Map<String, dynamic>>> notices() =>
      firestore.collection('notices').snapshots();
}
