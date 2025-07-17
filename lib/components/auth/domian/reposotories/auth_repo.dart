import 'dart:async';
import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/components/auth/domian/models/signup_model.dart';
import 'package:certain_salon/network/api_error_handling.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:certain_salon/util/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponseModel> registration(SignUpModel signUpModel) async {
    try {
      Response? response = await dioClient!.post(
        EndPoints.registerUri,
        data: signUpModel.toJson(),
      );
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> login({String? phone, String? password, String? type}) async {
    try {
      Response response = await dioClient!.post(EndPoints.loginUri,
        data: {"phone": phone, "password": password, "type": type},
      );
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> forgetPassword(String userInput, String type) async {
    try {
      Response response = await dioClient!.post(EndPoints.forgetPasswordUri, data: {"email_or_phone": userInput, "type": type});
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<void> saveUserToken(String token) async {
    dioClient!.token = token;
    dioClient!.dio!.options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};
    try {
      await sharedPreferences!.setString(AppConstants.token, token);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getDeviceToken() async {
    String? deviceToken = '@';
    try{
      //deviceToken = (await FirebaseMessaging.instance.getToken())!;

    }catch(error){
      if (kDebugMode) {
        print('error is: $error');
      }
    }
    if (deviceToken != null) {
      if (kDebugMode) {
        print('--------Device Token---------- $deviceToken');
      }
    }

    return deviceToken;
  }

  String getUserToken() {
    return sharedPreferences!.getString(AppConstants.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences!.containsKey(AppConstants.token);
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences!.remove(AppConstants.token);
    //await FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.topic);

  /*   await sharedPreferences!.remove(AppConstants.stroredSelectedDate);
    await sharedPreferences!.remove(AppConstants.stroredSelectedServiceId);
    await sharedPreferences!.remove(AppConstants.stroredSelectedEmployeeId);
    await sharedPreferences!.remove(AppConstants.stroredSelectedTimeSlot); */
   
    return true;
  }

  Future<void> saveUserNumberAndPassword(String userData) async {
    try {
      await sharedPreferences!.setString(AppConstants.userLogData, userData);
    } catch (e) {
      rethrow;
    }
  }

  String getUserLogData() {
    return sharedPreferences!.getString(AppConstants.userLogData) ?? "";
  }

  Future<bool> clearUserLog() async {
    return await sharedPreferences!.remove(AppConstants.userLogData);
  }

  Future<void> clearToken() async {
    dioClient!.updateHeader(getToken: null);
  }

 

}
