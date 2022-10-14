import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/src/blocs/survey/survey.state.dart';
import 'package:kalahok_mobile/src/models/survey.model.dart';
import 'package:kalahok_mobile/src/repositories/survey/survey.repo.dart';
import 'package:sqflite/sqlite_api.dart';

class SurveyBloc extends Cubit<SurveyState> {
  final _surveyRepo = SurveyRepository();
  final Database database;
  SurveyBloc({required this.database}) : super(const InitSurveyState(0));

  int _counter = 1;
  List<Survey> _surveys = [];
  List<Survey> get surveys => _surveys;

  Future<void> getSurveys() async {
    try {
      _surveys = await _surveyRepo.getSurveys(database: database);
      emit(InitSurveyState(_counter++));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addSurveys(String title) async {
    try {
      await _surveyRepo.addSurvey(database: database, title: title);
      emit(InitSurveyState(_counter++));
      getSurveys();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> removeSurvey(int id) async {
    try {
      await _surveyRepo.removeSurvey(database: database, id: id);
      emit(InitSurveyState(_counter++));
      getSurveys();
    } catch (e) {
      log(e.toString());
    }
  }
}
