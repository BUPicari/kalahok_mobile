import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/src/app.dart';
import 'package:kalahok_mobile/src/blocs/database/database.bloc.dart';

void main() {
  // runApp(const MyApp());
  runApp(MultiBlocProvider(providers: [
    BlocProvider<DatabaseBloc>(
        create: (context) => DatabaseBloc()..initDatabase())
  ], child: const MyApp()));
}
