import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/app/blocs/category/category_bloc.dart';
import 'package:kalahok_mobile/app/data/models/category_model.dart';
import 'package:kalahok_mobile/app/data/models/category_survey_model.dart';
import 'package:kalahok_mobile/app/screens/error_screen.dart';
import 'package:kalahok_mobile/app/screens/home_screen.dart';
import 'package:kalahok_mobile/app/widgets/category_survey_widget.dart';

class CategorySurveyScreen extends StatelessWidget {
  final Category category;

  const CategorySurveyScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc()
        ..add(GetCategorySurveyListEvent(categoryId: category.id)),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            )),
          ),
          title: Text(category.name),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: buildWelcome(),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.indigo],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategorySurveyLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CategorySurveyLoadedState) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 8),
                  buildCategorySurveys(categorySurvey: state.categorySurvey),
                ],
              );
            }
            if (state is CategoryErrorState) {
              // fix this ui later
              return ErrorScreen(error: state.error);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildWelcome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Active',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Text(
          'Surveys',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildCategorySurveys({required CategorySurvey categorySurvey}) {
    return SizedBox(
      height: 500,
      child: GridView(
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: categorySurvey.survey
            .map((survey) => CategorySurveyWidget(
                  survey: survey,
                  image: categorySurvey.image,
                ))
            .toList(),
      ),
    );
  }
}
