import 'package:flutter/material.dart';
import 'package:kalahok_mobile/try/model/category.dart';
import 'package:kalahok_mobile/try/model/option.dart';
import 'package:kalahok_mobile/try/model/question.dart';
import 'package:kalahok_mobile/try/widget/options_widget.dart';

class QuestionsWidget extends StatelessWidget {
  final Category category;
  final PageController controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Option> onClickedOption;

  const QuestionsWidget({
    Key? key,
    required this.category,
    required this.controller,
    required this.onChangedPage,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onChangedPage,
      controller: controller,
      itemCount: category.questions.length,
      itemBuilder: (context, index) {
        final question = category.questions[index];

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
            question.text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose your answer from below',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: OptionsWidget(
              question: question,
              onClickedOption: onClickedOption,
            ),
          ),
        ],
      ),
    );
  }
}
