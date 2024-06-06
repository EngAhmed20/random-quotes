import 'dart:convert';

import 'package:quotes_clean/core/error/exception.dart';
import 'package:quotes_clean/core/utils/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/quate_model.dart';
abstract class BaseLocalDataSource{
  Future<QuoteModel> getLastQuote();
  Future<void> cachedQuote(QuoteModel quote);

}
class LocalDataSource implements BaseLocalDataSource{
  final SharedPreferences sharedPreferences;
  LocalDataSource({required this.sharedPreferences});
  @override
  Future<QuoteModel> getLastQuote() {
    final jsonString= sharedPreferences.getString(AppStrings.cachedKey);
    if(jsonString!=null){
      return Future.value(QuoteModel.fromJson(json.decode(jsonString)));
    }
    else{
      throw CacheExeption();
    }

  }
  @override
  Future<void> cachedQuote(QuoteModel quote) {
return sharedPreferences.setString(AppStrings.cachedKey,
    json.encode(quote));
  }



}