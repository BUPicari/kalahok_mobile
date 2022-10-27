import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/data/resources/survey/survey_provider.dart';

class SurveyRepository {
  final _provider = SurveyProvider();

  Future<Survey> getSurveyList() {
    return _provider.getSurveyList();
  }
}

class NetworkError extends Error {}
