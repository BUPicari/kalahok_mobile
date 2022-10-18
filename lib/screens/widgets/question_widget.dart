import 'package:flutter/material.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/screens/widgets/choice_widget.dart';
import 'package:kalahok_mobile/screens/widgets/questions/open_ended.dart';
import 'package:kalahok_mobile/screens/widgets/questions/unkown.dart';
import 'package:kalahok_mobile/screens/widgets/questions/with_choices.dart';

class QuestionWidget extends StatelessWidget {
  final Survey survey;

  const QuestionWidget({Key? key, required this.survey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: survey.questionnaires.length,
      itemBuilder: (context, index) {
        final question = survey.questionnaires[index];
        return buildQuestion(question: question);
      },
    );
  }

  Widget buildQuestion({required Question question}) {
    switch (question.type) {
      case "multipleChoice":
        return WithChoicesQuestionWidget(
          question: question,
          subText: 'Please choose one choice from below',
        );
      case "openEnded":
        return OpenEndedQuestionWidget(question: question);
      case "trueOrFalse":
        return WithChoicesQuestionWidget(
          question: question,
          subText: 'Please choose True or False from below',
        );
      // case "rating":
      default:
        return const UnknownQuestionWidget();
    }
  }

  // Add the ff:
  // widget for rating
}
