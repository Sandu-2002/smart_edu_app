import 'package:cloud_firestore/cloud_firestore.dart';

class IdGeneratorService {
  final FirebaseFirestore firestore;
  IdGeneratorService(this.firestore);

  Future<String> nextStudentId() async {
    return _nextId(counterDoc: 'student', prefix: 'STU');
  }

  Future<String> nextParentId() async {
    return _nextId(counterDoc: 'parent', prefix: 'PAR');
  }

  Future<String> nextTeacherId() async {
    return _nextId(counterDoc: 'teacher', prefix: 'TEA');
  }

  Future<String> _nextId({
    required String counterDoc,
    required String prefix,
  }) async {
    final ref = firestore.collection('counters').doc(counterDoc);
    return firestore.runTransaction((tx) async {
      final snap = await tx.get(ref);
      final current = (snap.data()?['current'] ?? 0) as int;
      final next = current + 1;
      tx.set(ref, {'current': next}, SetOptions(merge: true));
      final year = DateTime.now().year;
      return '$prefix-$year-${next.toString().padLeft(4, '0')}';
    });
  }
}
