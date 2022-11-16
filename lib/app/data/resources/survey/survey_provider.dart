import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalahok_mobile/app/configs/api_config.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/data/models/survey_response_model.dart';

class SurveyProvider {
  Future<Survey> getSurveyList({required int categoryId}) async {
    var path = '/surveys/current-active?category=$categoryId&format-date=true';

    var url = Uri.parse(ApiConfig.baseUrl + path);
    http.Response response = await http.get(url);
    return Survey.fromJson(jsonDecode(response.body));
  }

  Future<void> postSubmitSurveyResponse({required Survey survey}) async {
    // var path = '/survey/responses';

    List<Questionnaires> questionnaires = survey.questionnaires
        .map((e) => Questionnaires(
              questionnaireId: e.id,
              answer: e.response.toString(),
            ))
        .toList();

    final responses = <Map<String, dynamic>>[
      SurveyResponse(
        surveyId: 1,
        questionnaires: questionnaires,
      ).toJson(),
    ];

    print(responses);
  }
}
