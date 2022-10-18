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
  // List<Rate> rates;
  String addedAt;
  String updatedAt;

  Question({
    required this.id,
    required this.question,
    required this.type,
    required this.choices,
    // required this.rates,
    required this.addedAt,
    required this.updatedAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var choicesJson = json['choices'] as List;
    List<Choice> choices = choicesJson.map((e) => Choice.fromJson(e)).toList();

    // var ratesJson = json['rates'] as List;
    // List<Rate> rates = ratesJson.map((e) => Rate.fromJson(e)).toList();

    if (json['type'] == "trueOrFalse") {
      choices.add(Choice(name: 'True'));
      choices.add(Choice(name: 'False'));
    }

    // if (rates.isEmpty && json['type'] == "rating") {
    //   rates.add(Rate(min: 1, max: 10));
    // }

    return Question(
      id: json['id'],
      question: json['question'],
      type: json['type'],
      choices: choices,
      // rates: rates,
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

class Rate {
  int min;
  int max;

  Rate({
    required this.min,
    required this.max,
  });

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      min: json['min'],
      max: json['max'],
    );
  }
}
