import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/common/models/error_response_model.dart';
import 'package:certain_salon/components/splash/providers/splash_provider.dart';
import 'package:certain_salon/helper/localization_helper.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_grocery/helper/custom_snackbar_helper.dart';
import 'package:provider/provider.dart';

class ApiCheckerHelper {
  static void checkApi(ApiResponseModel apiResponse) {
    ErrorResponseModel error = getError(apiResponse);
    //showCustomSnackBarHelper(getTranslated(error.errors?.first.message, Get.context!));
  }


  static ErrorResponseModel getError(ApiResponseModel apiResponse){
    ErrorResponseModel error;

    try{
      error = ErrorResponseModel.fromJson(apiResponse);
    }catch(e){
      if(apiResponse.error != null){
        error = ErrorResponseModel.fromJson(apiResponse.error);
      }else{
        error = ErrorResponseModel(errors: [Errors(code: '', message: apiResponse.error.toString())]);
      }
    }
    return error;
  }


}