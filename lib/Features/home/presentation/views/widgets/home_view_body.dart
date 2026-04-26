import 'package:bookly_app2/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app2/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app2/Features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';
import 'package:bookly_app2/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(),
              ),
              FeaturedBooksListViewBlocBuilder(),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text('Best Seller', style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
