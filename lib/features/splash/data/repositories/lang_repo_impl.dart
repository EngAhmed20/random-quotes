import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/error/failure.dart';
import 'package:quotes_clean/features/splash/domain/repositories/base_lang_repo.dart';

import '../data_sources/lang_local_data_source.dart';

class langRepoImpl extends BaseLangRepo{
  BaseLangLocalDataSource baseLangLocalDataSource;
  langRepoImpl({required this.baseLangLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String
  langCode}) async{
    try{
      final langIsChanged= await baseLangLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);

    }on CacheFailure {
      return Left(CacheFailure('cache failure'));
    }

  }

  @override
  Future<Either<Failure, String?>> getSavedLang() async{
    try{
      final langCode= await baseLangLocalDataSource.getSavedLang();
      return Right(langCode);

    }on CacheFailure {
      return Left(CacheFailure('cache failure'));
    }
  }

}