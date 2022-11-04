import 'package:flutter/material.dart';
import 'package:kalahok_mobile/try/model/category.dart';

class CategoryDetailWidget extends StatelessWidget {
  final Category category;
  final ValueChanged<Category> onSelectedCategory;

  const CategoryDetailWidget({
    Key? key,
    required this.category,
    required this.onSelectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelectedCategory(category),
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width * 0.65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(),
            const SizedBox(height: 12),
            Text(
              category.categoryName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 4),
            Text(
              category.description,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(category.imageUrl)),
      ),
    );
  }
}
