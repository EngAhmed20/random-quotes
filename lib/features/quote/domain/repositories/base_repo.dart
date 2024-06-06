import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/error/failure.dart';
import 'package:quotes_clean/features/quote/domain/entities/quote.dart';

abstract class BaseRepo{
  Future<Either<Failure,Quote>> getRandomQuote();
}