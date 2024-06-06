import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/error/failure.dart';
import 'package:quotes_clean/core/usecase/usecase.dart';

import '../repositories/base_lang_repo.dart';

class ChangeLangUseCase extends UseCase<bool,String>
{
  final BaseLangRepo baseLangRepo;

  ChangeLangUseCase({required this.baseLangRepo});

  @override
  Future<Either<Failure,bool>> call(String langCode) async{
    return await baseLangRepo.changeLang(langCode: langCode);
  }
}