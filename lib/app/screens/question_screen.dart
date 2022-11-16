import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/choice_model.dart';
import 'package:kalahok_mobile/app/data/models/question_model.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/screens/home_screen.dart';
import 'package:kalahok_mobile/app/widgets/question_numbers_widget.dart';
import 'package:kalahok_mobile/app/widgets/questions_widget.dart';

class QuestionScreen extends StatefulWidget {
  final Survey survey;

  const QuestionScreen({
    Key? key,
    required this.survey,
  }) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late PageController controller;
  late Question question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.survey.questionnaires.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: QuestionsWidget(
        survey: widget.survey,
        controller: controller,
        onChangedPage: (index) => nextQuestion(index: index),
        onClickedChoice: selectChoice,
      ),
    );
  }

  PreferredSizeWidget buildAppBar(context) {
    return AppBar(
      title: Text(widget.survey.title),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.indigo],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
      ),
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        )),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: QuestionNumbersWidget(
            questions: widget.survey.questionnaires,
            question: question,
            onClickedNumber: (index) => nextQuestion(
              index: index,
              jump: true,
            ),
          ),
        ),
      ),
    );
  }

  void selectChoice(Choice choice) {
    setState(() {
      question.selectedChoice = choice;
      question.response = choice.name;
    });
  }

  void nextQuestion({
    required int index,
    bool jump = false,
  }) {
    final indexPage = index;

    setState(() {
      question = widget.survey.questionnaires[indexPage];
    });

    if (jump) {
      controller.jumpToPage(indexPage);
    }
  }
}