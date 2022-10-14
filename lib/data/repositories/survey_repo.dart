import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalahok_mobile/config/api_config.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';

class SurveyRepository {
  Future<Survey> getSurvey() async {
    var url = Uri.parse(
        '${ApiConfig.baseUrl}/surveys/current-active?category=unifast&format-date=true');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return Survey.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
