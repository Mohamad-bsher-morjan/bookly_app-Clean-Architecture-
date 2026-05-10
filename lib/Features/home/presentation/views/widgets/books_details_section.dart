import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app2/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app2/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app2/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(image: book.image ?? ''),
        ),
        const SizedBox(height: 40),
        Text(
          book.title,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(book.authorName ?? '', style: Styles.textStyle18),
        ),
        const SizedBox(height: 5),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        SizedBox(height: 20),
        const BookAction(),
      ],
    );
  }
}
