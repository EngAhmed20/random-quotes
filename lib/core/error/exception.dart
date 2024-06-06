import 'package:equatable/equatable.dart';

class ServerException implements Exception{
  final String? message;

  const ServerException([this.message]);
}
class CacheExeption implements Exception{
}
class ErrorMsgModel extends Equatable {
  final int statusCode;
  final String message;
  final bool sucess;
  const ErrorMsgModel(
      {required this.statusCode, required this.message, required this.sucess});

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, message, sucess];

  factory ErrorMsgModel.fromJson(Map<String, dynamic> json)=>
      ErrorMsgModel(statusCode:json['status_code'],
          message: json['status_message'],
          sucess: json['success']);




}
class FetchDataException extends ServerException {
  const FetchDataException([message]) : super("Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super("Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super("Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super("Requested Info Not Found");
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super("Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
      : super("Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
      : super("No Internet Connection");
}

class CacheException implements Exception {}