import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/bloc/survey/survey_bloc.dart';
import 'package:kalahok_mobile/data/repositories/survey_repo.dart';
import 'package:kalahok_mobile/screens/error_screen.dart';
import 'package:kalahok_mobile/screens/widgets/questions/question_widget.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurveyBloc(
        RepositoryProvider.of<SurveyRepository>(context),
      )..add(LoadSurveyEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kalahok'),
        ),
        body: BlocBuilder<SurveyBloc, SurveyState>(
          builder: (context, state) {
            if (state is SurveyLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SurveyLoadedState) {
              return QuestionWidget(survey: state.survey);
            }
            if (state is SurveyErrorState) {
              // fix this ui later
              return ErrorScreen(error: state.error);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
