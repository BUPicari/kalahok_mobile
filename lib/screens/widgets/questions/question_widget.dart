import 'package:flutter/material.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/screens/widgets/questions/open_ended_question_widget.dart';
import 'package:kalahok_mobile/screens/widgets/questions/rating_question_widget.dart';
import 'package:kalahok_mobile/screens/widgets/questions/unkown_question_widget.dart';
import 'package:kalahok_mobile/screens/widgets/questions/with_choices_question_widget.dart';

class QuestionWidget extends StatelessWidget {
  final Survey survey;

  const QuestionWidget({Key? key, required this.survey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: survey.questionnaires.length,
      itemBuilder: (context, index) {
        final question = survey.questionnaires[index];
        return buildQuestion(
          question: question,
          itemCount: survey.questionnaires.length,
          index: index,
        );
      },
    );
  }

  Widget buildQuestion({
    required Question question,
    required int itemCount,
    required int index,
  }) {
    switch (question.type) {
      case "multipleChoice":
        return WithChoicesQuestionWidget(
          question: question,
          subText: 'Please choose one choice from below',
          itemCount: itemCount,
          index: index + 1,
        );
      case "openEnded":
        return OpenEndedQuestionWidget(
          question: question,
          itemCount: itemCount,
          index: index + 1,
        );
      case "trueOrFalse":
        return WithChoicesQuestionWidget(
          question: question,
          subText: 'Please choose True or False from below',
          itemCount: itemCount,
          index: index + 1,
        );
      case "rating":
        return RatingQuestionWidget(
          question: question,
          itemCount: itemCount,
          index: index + 1,
        );
      default:
        return const UnknownQuestionWidget();
    }
  }
}
