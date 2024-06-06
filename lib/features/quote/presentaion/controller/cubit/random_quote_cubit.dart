import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quotes_clean/core/error/failure.dart';
import 'package:quotes_clean/core/usecase/usecase.dart';
import 'package:quotes_clean/core/utils/app_string.dart';
import 'package:quotes_clean/features/quote/domain/entities/quote.dart';
import 'package:quotes_clean/features/quote/domain/usecases/get_randam_quote_use_case.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());
  final GetRandomQuoteUseCase getRandomQuoteUseCase;
  Future<void> getRandomQuote() async {
    final result = await getRandomQuoteUseCase(NoParams());
    result.fold((l) => emit(RandomQuoteError(message:ErrTypeMsg(l))),
            (r) => emit(RandomQuoteLoaded(quote:r)));
  }
  String ErrTypeMsg(Failure failure){
   switch(failure.runtimeType)
   {
     case ServerFailure:
       return AppStrings.serverFailure;
     case CacheFailure:
       return AppStrings.cacheFailure;
     default:
       return AppStrings.UnexpectedFailure;

   }

  }
}
