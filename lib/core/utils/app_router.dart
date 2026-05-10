import 'package:bookly_app2/Features/Splash/presentation/view/splash_view.dart';
import 'package:bookly_app2/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app2/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app2/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app2/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app2/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app2/core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kBookDetailsview = '/bookDetailsView';
  static const kHomeview = '/homeView';
  static const kSearchView = '/searchView';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: kHomeview,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kBookDetailsview,
        builder: (BuildContext context, GoRouterState state) {
          final book = state.extra as BookEntity;

          return BlocProvider(
            create: (context) => SimilarBooksCubit(
              FetchSimilarBooksUseCase(getIt.get<HomeRepoImpl>()),
            )..fetchSimilarBooks(category: book.category),
            child: BookDetailsView(book: book),
          );
        },
      ),

      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
    ],
  );
}
