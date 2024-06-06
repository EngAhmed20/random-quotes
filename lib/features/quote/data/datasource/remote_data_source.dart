import 'dart:convert';

import 'package:quotes_clean/core/api/end_point.dart';
import 'package:quotes_clean/core/error/exception.dart';
import 'package:quotes_clean/features/quote/data/models/quate_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/api/api_consumer.dart';
abstract class BaseRemoteDataRource{
 Future<QuoteModel> getRandomQuate();
}
class RemoteDataRource extends BaseRemoteDataRource
{
  ApiConsumer apiConsumer;
  RemoteDataRource({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuate() async{
    final response =await apiConsumer.get(
      endPoint.randomQuote,
    );
      return QuoteModel.fromJson(response);
    }

  }


