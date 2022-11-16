part of 'survey_bloc.dart';

@immutable
abstract class SurveyEvent extends Equatable {
  const SurveyEvent();

  @override
  List<Object> get props => [];
}

class GetSurveyListEvent extends SurveyEvent {
  final int categoryId;

  const GetSurveyListEvent({required this.categoryId});
}
