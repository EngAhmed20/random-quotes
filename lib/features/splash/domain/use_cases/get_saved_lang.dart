import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/usecase/usecase.dart';
import 'package:quotes_clean/features/splash/domain/repositories/base_lang_repo.dart';

import '../../../../core/error/failure.dart';

class GetSavedLangUseCase extends UseCase<String?,NoParams>
{
  final BaseLangRepo baseLangRepo;

  GetSavedLangUseCase({required this.baseLangRepo});

  @override
  Future<Either<Failure,String?>> call(NoParams params) async{
    return await baseLangRepo.getSavedLang();
  }
}