class CourseModel {
  final String courseId;
  final String title;
  final String teacherName;
  final String startTime;
  final String endTime;
  final String status;

  CourseModel({
    required this.courseId,
    required this.title,
    required this.teacherName,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      courseId: map['courseId'] ?? '',
      title: map['title'] ?? '',
      teacherName: map['teacherName'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      status: map['status'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'title': title,
      'teacherName': teacherName,
      'startTime': startTime,
      'endTime': endTime,
      'status': status,
    };
  }
}
