import 'dart:async';
import 'dart:convert';
import 'package:certain_salon/common/models/error_response_model.dart';
import 'package:certain_salon/common/models/reponse_model.dart';
import 'package:certain_salon/components/auth/domian/models/signup_model.dart';
import 'package:certain_salon/components/auth/domian/models/user_log_data.dart';
import 'package:certain_salon/components/auth/domian/reposotories/auth_repo.dart';
import 'package:certain_salon/components/splash/providers/splash_provider.dart';
import 'package:certain_salon/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/models/config_model.dart';
import 'package:certain_salon/common/models/api_response_model.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo? authRepo;
  final SharedPreferences? sharedPreferences;
  AuthProvider( {this.sharedPreferences,required this.authRepo});

  bool _isLoading = false;
  bool _isCheckedPhone = false;
  String? _registrationErrorMessage = '';
  bool _isActiveRememberMe = false;
  String? _loginErrorMessage = '';
  bool _isNumberLogin = false;

  bool get isLoading => _isLoading;
  bool get isCheckedPhone => _isCheckedPhone;
  String? get registrationErrorMessage => _registrationErrorMessage;
  bool get isActiveRememberMe => _isActiveRememberMe;
  String? get loginErrorMessage => _loginErrorMessage;
  bool get isNumberLogin => _isNumberLogin;



  void updateRegistrationErrorMessage(String message, bool isUpdate) {
    _registrationErrorMessage = message;

    if (isUpdate) {
      notifyListeners();
    }
  }

  Future<ResponseModel> registration(BuildContext buildContext,
      SignUpModel signUpModel, ConfigModel config) async {
    _isLoading = true;
    _isCheckedPhone = false;
    _registrationErrorMessage = '';
    notifyListeners();

    ApiResponseModel apiResponse = await authRepo!.registration(signUpModel);
    ResponseModel responseModel;
    String? token;
    String? tempToken;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //showCustomSnackBarHelper(getTranslated('registration_successful', Get.context!), isError: false);

      Map map = apiResponse.response!.data;
      if (map.containsKey('temporary_token')) {
        tempToken = map["temporary_token"];
      } else if (map.containsKey('token')) {
        token = map["token"];
      }

      if (token != null) {
        await login(buildContext, signUpModel.phone!, signUpModel.password);
        responseModel = ResponseModel(true, 'successful');
      } else {
        responseModel = ResponseModel(false, tempToken);
      }
    } else {
      _registrationErrorMessage =
          ErrorResponseModel.fromJson(apiResponse.error).errors![0].message;
      responseModel = ResponseModel(false, _registrationErrorMessage);
    }

    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> login(
      BuildContext buildContext, String phone, String? password) async {
    final SplashProvider splashProvider =
        Provider.of<SplashProvider>(Get.context!, listen: false);

    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();

    ApiResponseModel apiResponse =
        await authRepo!.login(phone: phone, password: password);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      String? token;
      Map map = apiResponse.response!.data;

      print(
          "------------------------ API RESPONSE : ${map.toString()}-----------------------------");

      if (map.containsKey('token')) {
        token = map["token"];
      }

      if (token != null) {
        await updateAuthToken(token);
        //final ProfileProvider profileProvider = Provider.of<ProfileProvider>(Get.context!, listen: false);
        //profileProvider.getUserInfo(true, isUpdate: false);
      }

      responseModel = ResponseModel(token != null, 'verification');
    } else {
      //_loginErrorMessage =ErrorResponseModel.fromJson(apiResponse.error).errors![0].message;
      responseModel = ResponseModel(false, _loginErrorMessage);
    }

    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> forgetPassword(String userInput, String type) async {
    _isLoading = true;
    notifyListeners();
    ApiResponseModel apiResponse =
        await authRepo!.forgetPassword(userInput, type);
    ResponseModel responseModel;

    print(
        "-------------------(FORGET PASSWORD)------------UserInput: $userInput------- and Type:$type");

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      responseModel =
          ResponseModel(true, apiResponse.response!.data["message"]);
    } else {
      responseModel = ResponseModel(false,
          ErrorResponseModel.fromJson(apiResponse.error).errors![0].message);
    }
    _isLoading = false;
    notifyListeners();

    return responseModel;
  }

  void onChangeRememberMeStatus({bool? value, bool isUpdate = true}) {
    if (value == null) {
      _isActiveRememberMe = !_isActiveRememberMe;
    } else {
      _isActiveRememberMe = value;
    }
    if (isUpdate) {
      notifyListeners();
    }
  }

  bool isLoggedIn() {
    return authRepo!.isLoggedIn();
  }

  Future<bool> clearSharedData() async {
    return await authRepo!.clearSharedData();
  }

  void saveUserNumberAndPassword(UserLogData userLogData) {
    authRepo!.saveUserNumberAndPassword(jsonEncode(userLogData.toJson()));
  }

  UserLogData? getUserData() {
    UserLogData? userData;
    try {
      userData = UserLogData.fromJson(jsonDecode(authRepo!.getUserLogData()));
    } catch (error) {
      debugPrint('error ====> $error');
    }
    return userData;
  }

  Future<bool> clearUserLogData() async {
    return authRepo!.clearUserLog();
  }

  String getUserToken() {
    return authRepo!.getUserToken();
  }

  void toggleIsNumberLogin({bool? value, bool isUpdate = true}) {
    if (value == null) {
      _isNumberLogin = !_isNumberLogin;
    } else {
      _isNumberLogin = value;
    }

    if (isUpdate) {
      notifyListeners();
    }
  }

  void onChangeLoadingStatus() {
    _isLoading = false;
  }

  Future<void> updateAuthToken(String token) async {
    authRepo!.saveUserToken(token);
  }

  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();
    //final SplashProvider splashProvider =Provider.of<SplashProvider>(Get.context!, listen: false);

    clearSharedData().then((value) {
      authRepo?.clearToken();
    });
    _isLoading = false;
    notifyListeners();
  }




}
