import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/question_model.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';

class PreviousNextButtonWidget extends StatelessWidget {
  final int index;
  final Question question;
  final Survey survey;
  final ValueChanged<int> onPressedPrev;
  final ValueChanged<int> onPressedNext;

  const PreviousNextButtonWidget({
    Key? key,
    required this.index,
    required this.question,
    required this.survey,
    required this.onPressedPrev,
    required this.onPressedNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 17),
      SizedBox(
        child: SizedBox(
          height: 50,
          child: Row(children: [
            buildPrevBtn(),
            const Spacer(),
            buildNextBtn(),
          ]),
        ),
      ),
    ]);
  }

  Widget buildPrevBtn() {
    bool condition = question == survey.questionnaires.first;
    var color = condition ? Colors.blueGrey : Colors.indigo;

    return Expanded(
      child: ElevatedButton(
        onPressed: condition ? null : () => onPressedPrev(index),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
          ),
        ),
        child: const Text(
          'Prev',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildNextBtn() {
    bool condition = question == survey.questionnaires.last;
    var color = condition ? Colors.blueGrey : Colors.indigo;

    return Expanded(
      child: ElevatedButton(
        onPressed: condition ? null : () => onPressedNext(index),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
          ),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
