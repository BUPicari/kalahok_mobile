import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalahok_mobile/config/api.config.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';

class SurveyRepository {
  Future<List<Survey>> getSurveys() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/users');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => Survey.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
