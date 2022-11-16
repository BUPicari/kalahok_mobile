import 'choice_model.dart';
import 'config_model.dart';
import 'rate_model.dart';

class Question {
  int id = 0;
  String question = "";
  String type = "";
  List<Choice> choices = [];
  List<Rate> rates = [];
  Config config = Config(
    multipleAnswer: false,
    canAddOthers: false,
    useYesOrNo: false,
  );
  String addedAt = "";
  String updatedAt = "";
  Choice? selectedChoice;
  String? response;

  Question({
    required this.id,
    required this.question,
    required this.type,
    required this.choices,
    required this.config,
    required this.rates,
    required this.addedAt,
    required this.updatedAt,
    this.selectedChoice,
    this.response,
  });

  // Question.setResponse(String res) {
  //   response = res;
  // }

  factory Question.fromJson(Map<String, dynamic> json) {
    var choicesJson = json['choices'] as List;
    List<Choice> choices = choicesJson.map((e) => Choice.fromJson(e)).toList();

    var ratesJson = json['rates'] as List;
    List<Rate> rates = ratesJson.map((e) => Rate.fromJson(e)).toList();

    var config = Config.fromJson(json['config']);

    if (json['type'] == "trueOrFalse") {
      choices.add(Choice(name: 'True'));
      choices.add(Choice(name: 'False'));
    }

    if (rates.isEmpty && json['type'] == "rating") {
      rates.add(Rate(min: "1", max: "10"));
    }

    return Question(
      id: json['id'],
      question: json['question'],
      type: json['type'],
      choices: choices,
      rates: rates,
      config: config,
      addedAt: json['added_at'],
      updatedAt: json['updated_at'],
    );
  }
}
