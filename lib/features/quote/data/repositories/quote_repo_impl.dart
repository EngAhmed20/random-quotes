import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/error/exception.dart';
import 'package:quotes_clean/core/error/failure.dart';
import 'package:quotes_clean/core/network/network_info.dart';
import 'package:quotes_clean/features/quote/domain/entities/quote.dart';
import 'package:quotes_clean/features/quote/domain/repositories/base_repo.dart';

import '../datasource/local_data_source.dart';
import '../datasource/remote_data_source.dart';

class QuoteRepoImpl implements BaseRepo{
  final  NetworkInfo networkInfo;
  final BaseRemoteDataRource baseRemoteDataRource;
  final BaseLocalDataSource baseLocalDataSource;
  QuoteRepoImpl({required this.baseRemoteDataRource, required this.networkInfo,
  required this.baseLocalDataSource
  });
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async{
  if(await networkInfo.isConnected)
    {
      try{
        final remoteDataSource=await baseRemoteDataRource.getRandomQuate();
        baseLocalDataSource.cachedQuote(remoteDataSource);
        return Right(remoteDataSource);
      } on ServerException{
        return Left(ServerFailure('server Failure'));

      }

    }else{
    try{
      final cache=await baseLocalDataSource.getLastQuote();
      return Right(cache);
    } on CacheExeption{
      return Left((CacheFailure('Cached Failure')));

    }


  }
  }


}