import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/surveys_model.dart';
import 'package:kalahok_mobile/app/helpers/variables.dart';
import 'package:kalahok_mobile/app/screens/survey_screen.dart';

class WaiverScreen extends StatelessWidget {
  final Surveys survey;

  const WaiverScreen({
    Key? key,
    required this.survey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColor.linearGradient,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(height: 50),
                    SizedBox(
                      child: Image.asset(
                        'assets/images/survey-waiver.png',
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      child: Text(
                        survey.description,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.subPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurveyScreen(survey: survey),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.subPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I AGREE',
                            style: TextStyle(
                              color: AppColor.subSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
