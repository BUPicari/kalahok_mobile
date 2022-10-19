import 'package:flutter/material.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/screens/widgets/questions/rate_widget.dart';

class RatingQuestionWidget extends StatelessWidget {
  final Question question;

  const RatingQuestionWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Please rate from below base on the question',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: RateWidget(question: question),
          ),
        ],
      ),
    );
  }
}
