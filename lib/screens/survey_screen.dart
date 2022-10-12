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
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            surveyList[index].firstname,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            surveyList[index].lastname,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(surveyList[index].avatar),
                          ),
                        ),
                      ),
                    );
                  });
            }
            if (state is SurveyErrorState) {
              return const Center(child: Text('Error'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
