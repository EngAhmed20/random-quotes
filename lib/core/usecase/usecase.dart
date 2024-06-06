import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/quote/domain/entities/quote.dart';
import '../error/failure.dart';

abstract class UseCase<type,params>{
  Future<Either<Failure,type>> call(params params);
}
class NoParams extends Equatable{
  @override
  List<Object> get props => [];
}