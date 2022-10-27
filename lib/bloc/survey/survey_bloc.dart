import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/data/resources/survey/survey_repo.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final SurveyRepository _surveyRepository = SurveyRepository();

  SurveyBloc() : super(SurveyInitialState()) {
    on<GetSurveyListEvent>((event, emit) async {
      try {
        emit(SurveyLoadingState());
        final survey = await _surveyRepository.getSurveyList();
        emit(SurveyLoadedState(survey));
        if (survey.error != null) {
          emit(SurveyErrorState(survey.error));
        }
      } on NetworkError {
        emit(const SurveyErrorState("Failed to fetch data"));
      }
    });
  }
}
