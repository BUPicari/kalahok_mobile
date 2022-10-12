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
  SurveyLoadedState(this.surveys);
  final List<Survey> surveys;

  @override
  List<Object> get props => [surveys];
}

//survey error loading state
class SurveyErrorState extends SurveyState {
  SurveyErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
