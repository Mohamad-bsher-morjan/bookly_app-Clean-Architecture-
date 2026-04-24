import 'package:bloc/bloc.dart';
import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchFeaturedBooksUseCase) : super(NewestBooksInitial());
  
  final FetchNewestBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure.errMessage));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
