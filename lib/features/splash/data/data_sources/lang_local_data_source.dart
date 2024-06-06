import 'package:quotes_clean/core/utils/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLangLocalDataSource{
  Future<bool>changeLang({required String langCode});
  Future<String?> getSavedLang();

}
class LangLocalDataSource extends BaseLangLocalDataSource{
  SharedPreferences sharedPreferences;
  LangLocalDataSource({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langCode}) async{
    return await sharedPreferences.setString(AppStrings.local,langCode);
  }

  @override
  Future<String?> getSavedLang() async{
    return await sharedPreferences.containsKey(AppStrings.local)
    ? await sharedPreferences.getString(AppStrings.local)
    :AppStrings.engCode;

  }

}