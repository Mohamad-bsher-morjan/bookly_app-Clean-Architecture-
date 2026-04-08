import 'package:bookly_app2/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> call([Param param]);
}
class NoParam {}
