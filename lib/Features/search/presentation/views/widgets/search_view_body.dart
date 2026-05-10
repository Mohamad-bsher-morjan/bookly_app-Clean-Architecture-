import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app2/Features/search/presentation/views/widgets/search_text_field.dart';
import 'package:bookly_app2/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          const SizedBox(height: 30),
          Text('Search Result', style: Styles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchResultListView(books: [],)),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
   const SearchResultListView({super.key, required this.books});
final List<BookEntity>books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(book:books[index] ,),
        );
      },
    );
  }
}
