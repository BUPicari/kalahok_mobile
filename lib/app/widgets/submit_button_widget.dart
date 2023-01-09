import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/helpers/variables.dart';
import 'package:kalahok_mobile/app/screens/survey_done_screen.dart';

class SubmitButtonWidget extends StatelessWidget {
  final Survey survey;

  const SubmitButtonWidget({
    Key? key,
    required this.survey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 17),
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurveyDoneScreen(survey: survey),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: AppColor.subPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    ]);
  }
}
