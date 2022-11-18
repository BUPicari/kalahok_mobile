import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/choice_model.dart';
import 'package:kalahok_mobile/app/data/models/question_model.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/widgets/questions/open_ended_question_widget.dart';
import 'package:kalahok_mobile/app/widgets/questions/rating_question_widget.dart';
import 'package:kalahok_mobile/app/widgets/questions/unkown_question_widget.dart';
import 'package:kalahok_mobile/app/widgets/questions/with_choices_question_widget.dart';

class QuestionsWidget extends StatelessWidget {
  final Survey survey;
  final PageController controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Choice> onClickedChoice;
  final ValueChanged<int> onClickedRate;
  final ValueChanged<String> onChanged;

  const QuestionsWidget({
    Key? key,
    required this.survey,
    required this.controller,
    required this.onChangedPage,
    required this.onClickedChoice,
    required this.onClickedRate,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onChangedPage,
      controller: controller,
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
          survey: survey,
          question: question,
          subText: 'Please choose one choice from below',
          onClickedChoice: onClickedChoice,
        );
      case "openEnded":
        return OpenEndedQuestionWidget(
          survey: survey,
          question: question,
          onChanged: onChanged,
        );
      case "trueOrFalse":
        return WithChoicesQuestionWidget(
          survey: survey,
          question: question,
          subText: 'Please choose True or False from below',
          onClickedChoice: onClickedChoice,
        );
      case "rating":
        return RatingQuestionWidget(
          survey: survey,
          question: question,
          onClickedRate: onClickedRate,
        );
      default:
        return const UnknownQuestionWidget();
    }
  }
}
