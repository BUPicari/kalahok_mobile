import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/data/repositories/survey_repo.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final SurveyRepository _surveyRepository;

  SurveyBloc(this._surveyRepository) : super(SurveyLoadingState()) {
    on<LoadSurveyEvent>((event, emit) async {
      emit(SurveyLoadingState());
      try {
        final survey = await _surveyRepository.getSurvey();
        emit(SurveyLoadedState(survey));
      } catch (e) {
        emit(SurveyErrorState(e.toString()));
      }
    });
  }
}
