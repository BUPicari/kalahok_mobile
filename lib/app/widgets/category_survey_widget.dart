import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/configs/api_config.dart';
import 'package:kalahok_mobile/app/data/models/surveys_model.dart';
import 'package:kalahok_mobile/app/screens/waiver_screen.dart';

class CategorySurveyWidget extends StatelessWidget {
  final Surveys survey;
  final String image;

  const CategorySurveyWidget({
    Key? key,
    required this.survey,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WaiverScreen(survey: survey),
      )),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              ApiConfig.baseUrl + image,
              width: 70,
            ),
            const SizedBox(height: 10),
            Text(
              survey.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
