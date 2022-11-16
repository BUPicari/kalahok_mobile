import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/question_model.dart';
import 'package:kalahok_mobile/app/screens/survey_done_screen.dart';

class SubmitButtonWidget extends StatelessWidget {
  final Question question;
  final Question lastQuestion;

  const SubmitButtonWidget({
    Key? key,
    required this.question,
    required this.lastQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (lastQuestion == question) {
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
                      builder: (context) => const SurveyDoneScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.white,
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

    return Container();
  }
}
