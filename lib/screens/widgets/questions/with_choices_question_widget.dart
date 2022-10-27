import 'package:flutter/material.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/screens/widgets/questions/choice_widget.dart';

class WithChoicesQuestionWidget extends StatelessWidget {
  final Question question;
  final String subText;
  final int itemCount;
  final int index;
  // final ValueChanged<Choice> onClickedChoice;

  const WithChoicesQuestionWidget({
    Key? key,
    required this.question,
    required this.subText,
    required this.itemCount,
    required this.index,
    // required this.onClickedChoice,
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
            'Part $index of $itemCount',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            question.question,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 8),
          Text(
            subText,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ChoiceWidget(
              question: question,
              // onClickedChoice: (question) {},
            ),
          ),
        ],
      ),
    );
  }
}
