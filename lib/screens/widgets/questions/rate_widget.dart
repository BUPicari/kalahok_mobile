import 'package:flutter/material.dart';
import 'package:kalahok_mobile/data/models/survey_model.dart';

class RateWidget extends StatelessWidget {
  final Question question;

  const RateWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stars =
        List<Widget>.generate(int.parse(question.rates[0].max), (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: stars,
    );
  }

  Widget _buildRatingStar(int index) {
    return const Icon(
      Icons.star_border_outlined,
      size: 30,
    );
  }
}
