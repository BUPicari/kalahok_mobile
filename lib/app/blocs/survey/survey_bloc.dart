import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/data/resources/survey/survey_repo.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final SurveyRepository _surveyRepository = SurveyRepository();

  SurveyBloc() : super(SurveyInitialState()) {
    on<GetSurveyListEvent>((event, emit) async {
      try {
        emit(SurveyLoadingState());
        final survey =
            await _surveyRepository.getSurveyList(categoryId: event.categoryId);
        emit(SurveyLoadedState(survey));
      } on NetworkError {
        emit(const SurveyErrorState("Failed to fetch data"));
      }
    });

    on<SubmitSurveyResponseEvent>((event, emit) async {
      try {
        final responses = await _surveyRepository.postSubmitSurveyResponse(
          survey: event.survey,
        );
        // emit(SurveySubmissionDoneState(responses));
        print(responses);
      } on NetworkError {
        emit(const SurveyErrorState("Failed to fetch data"));
      }
    });
  }
}
