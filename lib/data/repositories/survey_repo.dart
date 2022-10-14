import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalahok_mobile/config/api_config.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';

class SurveyRepository {
  Future<List<Survey>> getSurveys() async {
    var url = Uri.parse(
        '${ApiConfig.baseUrl}/surveys/current-active?category=unifast&format-date=true');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['questionnaires'];
      return result.map((e) => Survey.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
