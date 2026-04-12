
  import 'package:bookly_app2/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksDATA(List<BookEntity> books, String boxName) {
    var box = Hive.box(boxName);
    box.addAll(books);
  }