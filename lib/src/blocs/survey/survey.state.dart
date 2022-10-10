import 'package:equatable/equatable.dart';

abstract class SurveyState extends Equatable {
  const SurveyState();

  @override
  List<Object> get props => [];
}

class InitSurveyState extends SurveyState {
  final int counter;

  const InitSurveyState(this.counter);

  @override
  List<Object> get props => [counter];
}

class AddSurveyState extends SurveyState {}

class RemoveSurveyState extends SurveyState {}
