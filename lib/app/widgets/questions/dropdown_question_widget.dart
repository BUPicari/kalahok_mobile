import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/label_model.dart';
import 'package:kalahok_mobile/app/data/models/question_model.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/widgets/PreviousNextButtonWidget.dart';
import 'package:kalahok_mobile/app/widgets/question_text_widget.dart';
import 'package:kalahok_mobile/app/widgets/review_button_widget.dart';

class DropdownQuestionWidget extends StatelessWidget {
  final int index;
  final Survey survey;
  final Question question;
  final ValueChanged<String> onChanged;
  final ValueChanged<int> onPressedPrev;
  final ValueChanged<int> onPressedNext;

  const DropdownQuestionWidget({
    Key? key,
    required this.index,
    required this.survey,
    required this.question,
    required this.onChanged,
    required this.onPressedPrev,
    required this.onPressedNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          QuestionTextWidget(
            isRequired: question.config.isRequired,
            question: question.question,
          ),
          const SizedBox(height: 32),
          Expanded(
            child: buildDropdownForms(),
          ),
          PreviousNextButtonWidget(
            index: index,
            question: question,
            survey: survey,
            onPressedPrev: onPressedPrev,
            onPressedNext: onPressedNext,
          ),
          ReviewButtonWidget(
            question: question,
            survey: survey,
          ),
        ],
      ),
    );
  }

  Widget buildDropdownForms() {
    return ListView(
      children: question.labels
          .map(
            (label) => Column(
              children: [
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                    showSearchBox: true,
                  ),
                  items: const [
                    // {"name": "Abra", "id": 1401},
                    // {"name": "Agusan Del Norte", "id": 1602},
                    // {"name": "Agusan Del Sur", "id": 1603},
                    // {"name": "Aklan", "id": 604},
                    "Brazil",
                    "Italia",
                    "Tunisia",
                    'Canada',
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: label.name,
                      hintText: 'Select a ${label.name}',
                    ),
                  ),
                  onChanged: print,
                  // selectedItem: "Brazil",
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
          .toList(),
    );
  }
}
