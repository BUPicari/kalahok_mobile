import 'package:flutter/material.dart';
import 'package:kalahok_mobile/try/model/category.dart';
import 'package:kalahok_mobile/try/model/option.dart';
import 'package:kalahok_mobile/try/model/question.dart';
import 'package:kalahok_mobile/try/widget/question_numbers_widget.dart';
import 'package:kalahok_mobile/try/widget/questions_widget.dart';

class CategoryPage extends StatefulWidget {
  final Category category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late PageController controller;
  late Question question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.category.questions.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: QuestionsWidget(
        category: widget.category,
        controller: controller,
        onChangedPage: (index) => nextQuestion(index: index),
        onClickedOption: selectOption,
      ),
    );
  }

  PreferredSizeWidget buildAppBar(context) {
    return AppBar(
      title: Text(widget.category.categoryName),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.indigo],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: QuestionNumbersWidget(
            questions: widget.category.questions,
            question: question,
            onClickedNumber: (index) => nextQuestion(index: index, jump: true),
          ),
        ),
      ),
    );
  }

  void selectOption(Option option) {
    if (question.isLocked) {
      return;
    } else {
      setState(() {
        question.isLocked = true;
        question.selectedOption = option;
      });
    }
  }

  void nextQuestion({
    required int index,
    bool jump = false,
  }) {
    // final nextPage = controller.page + 1;
    // final indexPage = index ?? nextPage.toInt();
    final indexPage = index;

    setState(() {
      question = widget.category.questions[indexPage];
    });

    if (jump) {
      controller.jumpToPage(indexPage);
    }
  }
}
