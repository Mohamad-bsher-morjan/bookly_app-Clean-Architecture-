import 'package:bookly_app2/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?filter=free-ebooks&q=programming&startIndex=${pageNumber * 10}',
    );
    return getBooksList(data);
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?filter=free-ebooks&orderBy=newest&q=programming',
    );
    return getBooksList(data);
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?filter=free-ebooks&orderBy=relevance&q=subject:${Uri.encodeComponent(category)}',
    );
    return getBooksList(data);
  }
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  final items = data['items'] as List<dynamic>? ?? [];
  for (var bookMap in items) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}
