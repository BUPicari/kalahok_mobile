import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kalahok_mobile/config/api_config.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';

class SurveyProvider {
  Future<Survey> getSurveyList() async {
    const String path = '/surveys/current-active?category=2&format-date=true';

    try {
      var url = Uri.parse(ApiConfig.baseUrl + path);
      http.Response response = await http.get(url);
      return Survey.fromJson(jsonDecode(response.body));
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stacktrace: $stacktrace");
      }
      return Survey.withError("Data not found/ Connection issue");
    }
  }
}
