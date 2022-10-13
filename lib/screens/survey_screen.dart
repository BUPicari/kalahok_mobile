import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/bloc/survey/survey_bloc.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';
import 'package:kalahok_mobile/data/repositories/survey_repo.dart';

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
          title: const Text('Survey'),
        ),
        body: BlocBuilder<SurveyBloc, SurveyState>(
          builder: (context, state) {
            if (state is SurveyLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SurveyLoadedState) {
              List<Survey> surveyList = state.surveys;
              return ListView.builder(
                itemCount: surveyList.length,
                itemBuilder: (_, i) {
                  List<Choices> choices = surveyList[i].choices;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          surveyList[i].question,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text('a: ${choices[0].name}'),
                        // subtitle: ListView.builder(
                        //   itemCount: choices.length,
                        //   itemBuilder: (_, j) {
                        //     return Padding(
                        //       padding:
                        //           const EdgeInsets.symmetric(horizontal: 5),
                        //       child: Card(
                        //         color: Colors.blue,
                        //         elevation: 4,
                        //         margin: const EdgeInsets.symmetric(vertical: 5),
                        //         child: ListTile(
                        //           title: Text('$j: ${choices[j].name}'),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is SurveyErrorState) {
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
