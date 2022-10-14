import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/src/blocs/database/database.bloc.dart';
import 'package:kalahok_mobile/src/blocs/database/database.state.dart';
import 'package:kalahok_mobile/src/blocs/survey/survey.bloc.dart';
import 'package:kalahok_mobile/src/blocs/survey/survey.state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _title = "";
  SurveyBloc? _surveyBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<DatabaseBloc, DatabaseState>(
        listener: (context, state) {
          if (state is LoadDatabaseState) {
            _surveyBloc =
                SurveyBloc(database: context.read<DatabaseBloc>().database!);
          }
        },
        builder: (context, state) {
          if (state is LoadDatabaseState) {
            return BlocProvider<SurveyBloc>(
              create: (context) => _surveyBloc!..getSurveys(),
              child: BlocConsumer<SurveyBloc, SurveyState>(
                listener: (context, surveyState) {},
                builder: (context, surveyState) {
                  if (surveyState is InitSurveyState) {
                    final surveys = _surveyBloc!.surveys;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 1,
                            onChanged: (value) {
                              setState(() {
                                _title = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: surveys.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10.0),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        surveys[index].title,
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _surveyBloc!
                                            .removeSurvey(surveys[index].id);
                                      },
                                      icon: const Icon(Icons.delete),
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            );
          }
          return const Center(
            child: Text('Database not loaded'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_surveyBloc != null) {
            log(_title);
            _surveyBloc!.addSurveys(_title);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
