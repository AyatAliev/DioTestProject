import 'package:dartz/dartz.dart';
import 'package:example_project/domain/model/failure.dart';

abstract class AsyncUseCase<T> {
  Future<Either<Failure, T>> execute();
}
