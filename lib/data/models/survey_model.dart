class Survey {
  int id;
  String title;
  int answeredCount;
  String completionEstimatedTime;
  bool status;
  String addedAt;
  String updatedAt;
  List<Question> questionnaires;

  Survey({
    required this.id,
    required this.title,
    required this.answeredCount,
    required this.completionEstimatedTime,
    required this.status,
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
      answeredCount: json['answered_count'],
      completionEstimatedTime: json['completion_estimated_time'],
      status: json['status'],
      addedAt: json['added_at'],
      updatedAt: json['updated_at'],
      questionnaires: questions,
    );
  }
}

class Question {
  int id;
  String question;
  String type;
  List<Choice> choices;
  String addedAt;
  String updatedAt;

  Question({
    required this.id,
    required this.question,
    required this.type,
    required this.choices,
    required this.addedAt,
    required this.updatedAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var choicesJson = json['choices'] as List;
    List<Choice> choices = choicesJson.map((e) => Choice.fromJson(e)).toList();
    if (choices.isEmpty) {
      choices.add(Choice(name: 'Choice #1'));
    }

    return Question(
      id: json['id'],
      question: json['question'],
      type: json['type'],
      choices: choices,
      addedAt: json['added_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Choice {
  String name;

  Choice({
    required this.name,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      name: json['name'],
    );
  }
}
