import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app2/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  void cacheFeaturedBooks(List<BookEntity> books);
  void cacheNewestBooks(List<BookEntity> books);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }

  @override
  void cacheFeaturedBooks(List<BookEntity> books) {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    box.clear();
    box.addAll(books);
  }

  @override
  void cacheNewestBooks(List<BookEntity> books) {
    var box = Hive.box<BookEntity>(kNewestBox);
    box.clear();
    box.addAll(books);
  }
}
