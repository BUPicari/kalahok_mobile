class Survey {
  int id;
  String question;
  String type;
  List<Choices> choices;
  String addedAt;
  String updatedAt;

  Survey({
    required this.id,
    required this.question,
    required this.type,
    required this.choices,
    required this.addedAt,
    required this.updatedAt,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    var choicesJson = json['choices'] as List;
    List<Choices> c = choicesJson.map((e) => Choices.fromJson(e)).toList();
    if (c.isEmpty) {
      c.add(Choices(name: 'Choice #1'));
    }

    return Survey(
      id: json['id'],
      question: json['question'],
      type: json['type'],
      choices: c,
      addedAt: json['added_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Choices {
  String name;

  Choices({
    required this.name,
  });

  factory Choices.fromJson(Map<String, dynamic> json) {
    return Choices(
      name: json['name'],
    );
  }
}
