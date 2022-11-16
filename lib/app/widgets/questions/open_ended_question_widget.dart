import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/question_model.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/widgets/submit_button_widget.dart';

class OpenEndedQuestionWidget extends StatelessWidget {
  final Survey survey;
  final Question question;

  const OpenEndedQuestionWidget({
    Key? key,
    required this.survey,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            question.question,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 32),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your answer',
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
