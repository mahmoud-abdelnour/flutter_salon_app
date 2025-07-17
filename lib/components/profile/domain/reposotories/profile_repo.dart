import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/components/profile/domain/models/userInfo_model.dart';
import 'package:certain_salon/network/api_error_handling.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:certain_salon/util/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPrefrences;

  ProfileRepo({required this.dioClient, required this.sharedPrefrences});

  Future<ApiResponseModel> getUserInfo() async {
    try {
      final response = await dioClient!.post(EndPoints.userdata);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> updateProfile(UserInfoModel userInfoModel,
      [String? password]) async {
   
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userInfoModel'] = userInfoModel;
    data['password'] = password;
    
    try {
      final response =
          await dioClient!.post(EndPoints.updateUserData, data: data);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
