import 'package:flutter/material.dart';
import 'package:kalahok_mobile/try/data/categories.dart';
import 'package:kalahok_mobile/try/data/user.dart';
// import 'package:kalahok_mobile/try/page/category_page.dart';
// import 'package:kalahok_mobile/try/widget/category_detail_widget.dart';
import 'package:kalahok_mobile/try/widget/category_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/kalahok-logo.png'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Kalahok'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: buildWelcome(username),
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
        // actions: const [
        //   Icon(Icons.search),
        //   SizedBox(width: 12),
        // ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          buildCategories(),
          // const SizedBox(height: 32),
          // buildPopular(context),
        ],
      ),
    );
  }

  Widget buildWelcome(String username) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Text(
          username,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget buildCategories() {
    return SizedBox(
      height: 300,
      child: GridView(
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: categories
            .map((category) => CategoryHeaderWidget(category: category))
            .toList(),
      ),
    );
  }

  // Widget buildPopular(BuildContext context) {
  //   return Column(
  //     children: [
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         child: const Text(
  //           'Popular',
  //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       const SizedBox(height: 16),
  //       SizedBox(
  //         height: 240,
  //         child: ListView(
  //           physics: const BouncingScrollPhysics(),
  //           scrollDirection: Axis.horizontal,
  //           children: categories
  //               .map((category) => CategoryDetailWidget(
  //                     category: category,
  //                     onSelectedCategory: (category) {
  //                       Navigator.of(context).push(MaterialPageRoute(
  //                         builder: (context) =>
  //                             CategoryPage(category: category),
  //                       ));
  //                     },
  //                   ))
  //               .toList(),
  //         ),
  //       )
  //     ],
  //   );
  // }
}
