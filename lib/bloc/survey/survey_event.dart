part of 'survey_bloc.dart';

@immutable
abstract class SurveyEvent extends Equatable {
  const SurveyEvent();
}

class LoadSurveyEvent extends SurveyEvent {
  @override
  List<Object> get props => [];
}
