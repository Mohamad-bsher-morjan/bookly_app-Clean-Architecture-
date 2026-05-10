import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app2/core/errors/failure.dart';
import 'package:bookly_app2/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String category = '']) async {
    return await homeRepo.fetchSimilarBooks(category: category);
  }
}
