import 'package:dartz/dartz.dart';
import 'package:flutter_application_posts_api/core/error/failure.dart';

abstract class Usecase<Type> {
  Future<Either<Failure, Type>> call();
}
