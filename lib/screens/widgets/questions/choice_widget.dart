import 'package:flutter/material.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/utils.dart';

class ChoiceWidget extends StatelessWidget {
  final Question question;

  const ChoiceWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: Utils.heightBetween(
        question.choices
            .map((choice) => _buildChoiceContainer(context, choice))
            .toList(),
        height: 8,
      ),
    );
  }

  Widget _buildChoiceContainer(BuildContext context, Choice choice) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            _buildChoice(choice),
          ],
        ),
      ),
    );
  }

  Widget _buildChoice(Choice choice) {
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
