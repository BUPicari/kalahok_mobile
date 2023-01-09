import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/helpers/variables.dart';

class QuestionTextWidget extends StatelessWidget {
  final bool isRequired;
  final String question;

  const QuestionTextWidget({
    Key? key,
    required this.isRequired,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isRequired) {
      return RichText(
        text: TextSpan(
          text: question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColor.subSecondary,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' *',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                // color: Colors.red,
                color: AppColor.error,
              ),
            ),
          ],
        ),
      );
    }

    return Text(
      question,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
