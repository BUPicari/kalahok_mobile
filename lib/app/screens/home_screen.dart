import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/app/blocs/category/category_bloc.dart';
import 'package:kalahok_mobile/app/configs/app_config.dart';
import 'package:kalahok_mobile/app/data/models/category_model.dart';
import 'package:kalahok_mobile/app/helpers/variables.dart';
import 'package:kalahok_mobile/app/screens/error_screen.dart';
import 'package:kalahok_mobile/app/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc()..add(GetCategoryListEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset(AppConfig.logo),
          title: Text(AppConfig.name),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: buildWelcome(),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColor.linearGradient,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CategoryLoadedState) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 8),
                  buildCategories(categories: state.categories),
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
      children: [
        Text(
          'Hello please',
          style: TextStyle(fontSize: 16, color: AppColor.subPrimary),
        ),
        Text(
          'Choose a category',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.subPrimary,
          ),
        ),
      ],
    );
  }

  Widget buildCategories({required List<Category> categories}) {
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
        children: categories
            .map((category) => CategoryWidget(category: category))
            .toList(),
      ),
    );
  }
}
