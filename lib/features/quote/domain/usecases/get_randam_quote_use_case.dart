import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/error/failure.dart';
import 'package:quotes_clean/core/usecase/usecase.dart';
import 'package:quotes_clean/features/quote/domain/entities/quote.dart';
import 'package:quotes_clean/features/quote/domain/repositories/base_repo.dart';

class GetRandomQuoteUseCase implements UseCase<Quote,NoParams>{
  final BaseRepo base_repo;

  GetRandomQuoteUseCase({required this.base_repo});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return base_repo.getRandomQuote();

  }
}