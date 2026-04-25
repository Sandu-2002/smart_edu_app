class NoticeModel {
  final String noticeId;
  final String subject;
  final String audience;
  final String body;
  final String attachmentUrl;
  final bool urgent;

  NoticeModel({
    required this.noticeId,
    required this.subject,
    required this.audience,
    required this.body,
    required this.attachmentUrl,
    required this.urgent,
  });

  factory NoticeModel.fromMap(Map<String, dynamic> map) {
    return NoticeModel(
      noticeId: map['noticeId'] ?? '',
      subject: map['subject'] ?? '',
      audience: map['audience'] ?? '',
      body: map['body'] ?? '',
      attachmentUrl: map['attachmentUrl'] ?? '',
      urgent: map['urgent'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'noticeId': noticeId,
      'subject': subject,
      'audience': audience,
      'body': body,
      'attachmentUrl': attachmentUrl,
      'urgent': urgent,
    };
  }
}
