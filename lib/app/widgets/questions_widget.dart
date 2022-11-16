import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/choice_model.dart';
import 'package:kalahok_mobile/app/data/models/question_model.dart';
import 'package:kalahok_mobile/app/widgets/questions/open_ended_question_widget.dart';
import 'package:kalahok_mobile/app/widgets/questions/rating_question_widget.dart';
import 'package:kalahok_mobile/app/widgets/questions/unkown_question_widget.dart';
import 'package:kalahok_mobile/app/widgets/questions/with_choices_question_widget.dart';

class QuestionsWidget extends StatelessWidget {
  final List<Question> questionnaires;
  final PageController controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Choice> onClickedChoice;

  const QuestionsWidget({
    Key? key,
    required this.questionnaires,
    required this.controller,
    required this.onChangedPage,
    required this.onClickedChoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onChangedPage,
      controller: controller,
      itemCount: questionnaires.length,
      itemBuilder: (context, index) {
        final question = questionnaires[index];

        return buildQuestion(
          questionnaires: questionnaires,
          question: question,
        );
      },
    );
  }

  Widget buildQuestion({
    required List<Question> questionnaires,
    required Question question,
  }) {
    switch (question.type) {
      case "multipleChoice":
        return WithChoicesQuestionWidget(
          questionnaires: questionnaires,
          question: question,
          subText: 'Please choose one choice from below',
          onClickedChoice: onClickedChoice,
        );
      case "openEnded":
        return OpenEndedQuestionWidget(
          questionnaires: questionnaires,
          question: question,
        );
      case "trueOrFalse":
        return WithChoicesQuestionWidget(
          questionnaires: questionnaires,
          question: question,
          subText: 'Please choose True or False from below',
          onClickedChoice: onClickedChoice,
        );
      case "rating":
        return RatingQuestionWidget(
          questionnaires: questionnaires,
          question: question,
        );
      default:
        return const UnknownQuestionWidget();
    }
  }
}
