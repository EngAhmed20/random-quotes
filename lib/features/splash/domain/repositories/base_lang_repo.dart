import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/error/failure.dart';

abstract class BaseLangRepo{
  Future<Either<Failure,bool>>changeLang({required String langCode});
  Future<Either<Failure,String?>> getSavedLang();

}