import 'package:bloc/bloc.dart';
import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
    : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(failure.errMessage));
        } else {
          emit(
            FeaturedBooksPaginationFailure(failure.errMessage),
          ); //اظهار emit خاصة بموضوع فشل pagination failure state
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
