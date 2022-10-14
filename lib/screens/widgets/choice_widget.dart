import 'package:flutter/material.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/utils.dart';

class ChoiceWidget extends StatelessWidget {
  final Question question;
  // final ValueChanged<Choice> onClickedOption;

  const ChoiceWidget({
    Key? key,
    required this.question,
    // required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: Utils.heightBetween(
        question.choices
            .map((choice) => buildChoiceContainer(context, choice))
            .toList(),
        height: 8,
      ),
    );
  }

  Widget buildChoiceContainer(BuildContext context, Choice choice) {
    return GestureDetector(
      // onTap: () => onClickedOption(option),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            buildChoice(choice),
          ],
        ),
      ),
    );
  }

  Widget buildChoice(Choice choice) {
    return SizedBox(
      height: 50,
      child: Row(children: [
        // Text(
        //   choice.code,
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        // ),
        // SizedBox(width: 12),
        Text(
          choice.name,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
