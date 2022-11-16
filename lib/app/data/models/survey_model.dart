import 'question_model.dart';

class Survey {
  int id = 0;
  String title = "";
  String description = "";
  int answeredCount = 0;
  String completionEstimatedTime = "";
  bool status = false;
  bool multipleSubmission = false;
  String startDate = "";
  String endDate = "";
  String addedAt = "";
  String updatedAt = "";
  List<Question> questionnaires = [];

  Survey({
    required this.id,
    required this.title,
    required this.description,
    required this.answeredCount,
    required this.completionEstimatedTime,
    required this.status,
    required this.multipleSubmission,
    required this.startDate,
    required this.endDate,
    required this.addedAt,
    required this.updatedAt,
    required this.questionnaires,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    var questionnairesJson = json['questionnaires'] as List;
    List<Question> questions =
        questionnairesJson.map((e) => Question.fromJson(e)).toList();

    return Survey(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      answeredCount: json['answered_count'],
      completionEstimatedTime: json['completion_estimated_time'],
      status: json['status'],
      multipleSubmission: json['multipleSubmission'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      addedAt: json['added_at'],
      updatedAt: json['updated_at'],
      questionnaires: questions,
    );
  }
}
