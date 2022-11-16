import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalahok_mobile/app/configs/api_config.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';

class SurveyProvider {
  Future<Survey> getSurveyList({required int categoryId}) async {
    var path = '/surveys/current-active?category=$categoryId&format-date=true';

    var url = Uri.parse(ApiConfig.baseUrl + path);
    http.Response response = await http.get(url);
    return Survey.fromJson(jsonDecode(response.body));
  }
}
