import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalahok_mobile/try/data/questions.dart';
import 'package:kalahok_mobile/try/model/category.dart';

final categories = <Category>[
  Category(
    questions: questions,
    categoryName: 'DRRMO',
    imageUrl: 'assets/images/kalahok-logo.png',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.rocket,
    description: 'Practice questions from various chapters in physics',
  ),
  Category(
    questions: questions,
    imageUrl: 'assets/images/kalahok-logo.png',
    categoryName: 'Unifast',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.atom,
    description: 'Practice questions from various chapters in chemistry',
  ),
];
