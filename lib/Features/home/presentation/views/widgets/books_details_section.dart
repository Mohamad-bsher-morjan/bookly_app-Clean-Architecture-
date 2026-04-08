import 'package:bookly_app2/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app2/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app2/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app2/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: FeaturedListViewItem(),
        ),
        const SizedBox(height: 40),
        const Text('The Jungle Book', style: Styles.textStyle30),
        SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: const Text('Rudyard Kipling', style: Styles.textStyle18),
        ),
        const SizedBox(height: 18),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        SizedBox(height: 20),
        const BookAction(),
      ],
    );
  }
}
