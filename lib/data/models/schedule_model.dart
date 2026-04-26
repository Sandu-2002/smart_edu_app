class ScheduleModel {
  final String scheduleId;
  final String subject;
  final String teacherName;
  final String room;
  final String startTime;
  final String endTime;
  final String status;
  final String date;

  ScheduleModel({
    required this.scheduleId,
    required this.subject,
    required this.teacherName,
    required this.room,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.date,
  });

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      scheduleId: map['scheduleId'] ?? '',
      subject: map['subject'] ?? '',
      teacherName: map['teacherName'] ?? '',
      room: map['room'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      status: map['status'] ?? '',
      date: map['date'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'scheduleId': scheduleId,
      'subject': subject,
      'teacherName': teacherName,
      'room': room,
      'startTime': startTime,
      'endTime': endTime,
      'status': status,
      'date': date,
    };
  }
}
