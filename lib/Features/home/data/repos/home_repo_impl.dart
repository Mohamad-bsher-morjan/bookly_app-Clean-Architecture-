import 'package:bookly_app2/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app2/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app2/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
      homeLocalDataSource.cacheFeaturedBooks(books);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      homeLocalDataSource.cacheNewestBooks(books);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
