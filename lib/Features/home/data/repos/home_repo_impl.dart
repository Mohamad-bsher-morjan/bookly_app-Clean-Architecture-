import 'package:bookly_app2/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app2/Features/home/data/data_sources/home_remote_source.dart';
import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app2/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();

      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks()async {
   try {
      var booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();

      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
