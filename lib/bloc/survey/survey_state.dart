part of 'survey_bloc.dart';

@immutable
abstract class SurveyState extends Equatable {}

//survey loading state
class SurveyLoadingState extends SurveyState {
  @override
  List<Object> get props => [];
}

//survey loaded state
class SurveyLoadedState extends SurveyState {
  SurveyLoadedState(this.survey);
  final Survey survey;

  @override
  List<Object> get props => [survey];
}

//survey error loading state
class SurveyErrorState extends SurveyState {
  SurveyErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
