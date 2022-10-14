import 'package:flutter/material.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/screens/widgets/choice_widget.dart';

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
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            question.question,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please choose one choice from below',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ChoiceWidget(
              question: question,
              // onClickedOption: onClickedOption,
            ),
          ),
        ],
      ),
    );
  }

  // Add the ff:
  // widget for multiple choice
  // widget for ratings
  // widget open ended
  // widget true or false
}
