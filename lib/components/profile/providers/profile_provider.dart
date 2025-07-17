import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/common/models/error_response_model.dart';
import 'package:certain_salon/components/profile/domain/models/userInfo_model.dart';
import 'package:certain_salon/components/profile/domain/reposotories/profile_repo.dart';
import 'package:certain_salon/components/service/domain/models/service_model.dart';
import 'package:certain_salon/components/service/domain/reposotories/service_repo.dart';
import 'package:certain_salon/helper/api_checker_helper.dart';
import 'package:flutter/material.dart';

import '../../../common/models/reponse_model.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepo? profileRepo;

  ProfileProvider({required this.profileRepo});

  UserInfoModel? _userInfoModel;
  bool _isLoading = false;
  String? _countryCode;

  UserInfoModel? get userInfoModel => _userInfoModel;
  String? get countryCode => _countryCode;
  bool get isLoading => _isLoading;

  String? _registrationErrorMessage = '';

  Future<void> getUserInfo(bool reload, {bool isUpdate = true}) async {
    _isLoading = true;
    if (reload) {
      _userInfoModel = null;
    }

    if (_userInfoModel == null) {
      ApiResponseModel apiResponse = await profileRepo!.getUserInfo();
      print(
          "----------------API RESPONSE USER INFO ${apiResponse.response?.data}");
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _userInfoModel = UserInfoModel.fromJson(apiResponse.response!.data);
      } else {
        ApiCheckerHelper.checkApi(apiResponse);
      }
    }

    _isLoading = false;
    if (isUpdate) {
      notifyListeners();
    }
  }

  Future<ResponseModel> updateUserInfo(UserInfoModel updateUserModel, [String? password]) async {
    _isLoading = true;
    notifyListeners();
    ResponseModel responseModel;
    _registrationErrorMessage = '';

    ApiResponseModel apiResponse = await profileRepo!.updateProfile(updateUserModel,password);

    //print("----------------API RESPONSE USER INFO ${apiResponse.response?.data}");
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _userInfoModel = UserInfoModel.fromJson(apiResponse.response!.data);
      Map map = apiResponse.response!.data;
      String? message = map['msg'];

      _userInfoModel = updateUserModel;
      responseModel = ResponseModel(true, message);
    } else {
      _registrationErrorMessage = ErrorResponseModel.fromJson(apiResponse.error).errors![0].message;
      responseModel = ResponseModel(false, _registrationErrorMessage);
    }

    _isLoading = false;
    notifyListeners();

    return responseModel;
  }
}
