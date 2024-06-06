import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:quotes_clean/core/usecase/usecase.dart';
import 'package:quotes_clean/core/utils/app_string.dart';

import '../../../domain/use_cases/change_lang.dart';
import '../../../domain/use_cases/get_saved_lang.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;
  LocalCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(ChangeLocalState(Locale(AppStrings.engCode)));

  String currentLang=AppStrings.engCode;
  Future<void> getSavedLang()async
  {
    final response= await getSavedLangUseCase.call(NoParams());
    response.fold((l) =>debugPrint('Cache Failure'), (r){
      currentLang=r!;
      emit(ChangeLocalState(Locale(currentLang)));
    });

}
Future<void> changeLang(String langCode)async
{
  final response= await changeLangUseCase.call(langCode);
  response.fold((l) =>debugPrint('Cache Failure'), (r){
    currentLang=langCode;
    emit(ChangeLocalState(Locale(currentLang)));
  });

}
void toEng()=>changeLang(AppStrings.engCode);
  void toArabic()=>changeLang(AppStrings.arabicCode);

}
