import 'package:certain_salon/common/reposotories/langauge_repo.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider extends ChangeNotifier {
  final DioClient? dioClient;
  final LanguageRepo? languageRepo;
  final SharedPreferences? sharedPreferences;

  LocalizationProvider(
      {required this.dioClient,
      required this.sharedPreferences,
      required this.languageRepo}) {
    _loadCurrentLanguage();
  }

  int? _languageIndex;
  Locale _locale = Locale(AppConstants.languages[0].languageCode!,
      AppConstants.languages[0].countryCode);
  bool _isLtr = true;

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  int? get languageIndex => _languageIndex;

  void _loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences!.getString(AppConstants.languageCode) ??
            AppConstants.languages[0].languageCode!,
        sharedPreferences!.getString(AppConstants.countryCode) ??
            AppConstants.languages[0].countryCode);
    _isLtr = _locale.languageCode != 'ar';
    
    //toggle this line to make switch language button
    setLanguage(Locale(AppConstants.languages[0].languageCode!,AppConstants.languages[0].countryCode));

    notifyListeners();
  }

  void _saveLanguage(Locale locale) async {
    sharedPreferences!
        .setString(AppConstants.languageCode, locale.languageCode);
    sharedPreferences!.setString(AppConstants.countryCode, locale.countryCode!);
  }

  Future<void> setLanguage(Locale locale) async {
    _locale = locale;
    if (_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }
    await dioClient!
        .updateHeader(
            languageCode: locale.languageCode,
            getToken: sharedPreferences?.getString(AppConstants.token))
        .then((value) {
      //HomeScreen.loadData(true, Get.context!, fromLanguage: true);
    });
    notifyListeners();

    _saveLanguage(_locale);
    notifyListeners();
  }

}
