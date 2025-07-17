// ignore_for_file: file_names
import 'package:certain_salon/network/api_error_handling.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:certain_salon/util/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:certain_salon/common/models/api_response_model.dart';

class SplashRepo {
  final DioClient? dioCLient;
  final SharedPreferences? sharedPreferences;

  SplashRepo({required this.sharedPreferences, required this.dioCLient});

  Future<ApiResponseModel> getConfig() async {
    try {
      final response = await dioCLient!.get(EndPoints.configUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withSuccess(ApiErrorHandler.getMessage(e));
    }
  }

  Future<bool> initSharedData() {
    if (!sharedPreferences!.containsKey(AppConstants.theme)) {
      return sharedPreferences!.setBool(AppConstants.theme, false);
    }
    if (!sharedPreferences!.containsKey(AppConstants.countryCode)) {
      return sharedPreferences!.setString(AppConstants.countryCode, 'US');
    }
    if (!sharedPreferences!.containsKey(AppConstants.languageCode)) {
      return sharedPreferences!.setString(AppConstants.languageCode, 'en');
    }

    return Future.value(true);
  }

  Future<bool> removeSharedData() {
    return sharedPreferences!.clear();
  }

  void disableIntro() {
    sharedPreferences!.setBool(AppConstants.onBoardingSkip, false);
  }

  bool showIntro() {
    return sharedPreferences!.getBool(AppConstants.onBoardingSkip) ?? true;
  }

 Future<ApiResponseModel> getHomeScreenData() async {
    try {
      final response = await dioCLient!.get(EndPoints.homeScreenDataUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withSuccess(ApiErrorHandler.getMessage(e));
    }
  }
}
