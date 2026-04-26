class ResultModel {
  final String resultId;
  final String studentId;
  final String subject;
  final double marks;
  final String grade;
  final String term;

  ResultModel({
    required this.resultId,
    required this.studentId,
    required this.subject,
    required this.marks,
    required this.grade,
    required this.term,
  });

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      resultId: map['resultId'] ?? '',
      studentId: map['studentId'] ?? '',
      subject: map['subject'] ?? '',
      marks: (map['marks'] ?? 0).toDouble(),
      grade: map['grade'] ?? '',
      term: map['term'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resultId': resultId,
      'studentId': studentId,
      'subject': subject,
      'marks': marks,
      'grade': grade,
      'term': term,
    };
  }
}
