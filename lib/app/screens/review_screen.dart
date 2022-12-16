import 'package:flutter/material.dart';
import 'package:kalahok_mobile/app/data/models/question_model.dart';
import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/helpers/utils.dart';
import 'package:kalahok_mobile/app/screens/question_screen.dart';
import 'package:kalahok_mobile/app/widgets/submit_button_widget.dart';

class ReviewScreen extends StatelessWidget {
  final Survey survey;

  const ReviewScreen({
    Key? key,
    required this.survey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 5),
                Text(
                  '* Red boxes is required and has no answers',
                  style: TextStyle(
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '* Gray boxes is not required and has no answers',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '* Green boxes has answers',
                  style: TextStyle(
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: Utils.heightBetween(
                  _buildListViewChildren(),
                  height: 8,
                ),
              ),
            ),
            SubmitButtonWidget(survey: survey),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildListViewChildren() {
    return survey.questionnaires.map(
      (question) {
        return Card(
          color: getColorForBox(question),
          child: ExpansionTile(
            title: Text(
              question.question,
              style: const TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 16,
              ),
            ),
            children: [
              Container(
                color: Colors.black12,
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: question.getReviewResponse(),
              ),
            ],
          ),
        );
      },
    ).toList();
  }

  PreferredSizeWidget buildAppBar(context) {
    return AppBar(
      title: const Text('Review Survey'),
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
          builder: (context) => QuestionScreen(survey: survey),
        )),
      ),
    );
  }

  Color getColorForBox(Question question) {
    Color boxColor = Colors.grey;

    if (question.config.isRequired &&
        question.response == null &&
        question.addedOthers == null) {
      boxColor = const Color(0xfff8d7da);
    } else if (question.response != null || question.addedOthers != null) {
      boxColor = const Color(0xffd4edda);
    }

    return boxColor;
  }
}
