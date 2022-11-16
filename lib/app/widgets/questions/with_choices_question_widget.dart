import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/choice_model.dart';
import 'package:kalahok_mobile/app/data/models/question_model.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/widgets/questions/choice_widget.dart';
import 'package:kalahok_mobile/app/widgets/submit_button_widget.dart';

class WithChoicesQuestionWidget extends StatelessWidget {
  final Survey survey;
  final Question question;
  final String subText;
  final ValueChanged<Choice> onClickedChoice;

  const WithChoicesQuestionWidget({
    Key? key,
    required this.survey,
    required this.question,
    required this.subText,
    required this.onClickedChoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            question.question,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 8),
          Text(
            subText,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ChoiceWidget(
              question: question,
              onClickedChoice: onClickedChoice,
            ),
          ),
          SubmitButtonWidget(
            question: question,
            survey: survey,
          ),
        ],
      ),
    );
  }
}
