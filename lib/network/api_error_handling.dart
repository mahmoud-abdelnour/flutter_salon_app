import 'dart:convert';

import 'package:certain_salon/helper/localization_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:certain_salon/common/models/error_response_model.dart';
import 'package:certain_salon/main.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    //print("asqqqqqqaaaaa${error.response}");
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          //print('error.type');
          //print(error.type);

          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;

            case DioExceptionType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 500:
                case 503:
                  errorDescription = error.response!.statusMessage;
                  break;
                case 400:
                  if (error.response!.data['error'] == 'token_not_provided') {
                    var errMap = <String, dynamic>{};
                    List<dynamic> errorsList = [];
                    var errorItem = <String, dynamic>{};
                    errorItem['message'] = 'token_not_provided';
                    errorItem['code'] = 'token_not_provided';
                    errorsList.add(errorItem);
                    errMap['errors'] = errorsList;
                    ErrorResponseModel? errorResponse;
                    errorResponse = ErrorResponseModel.fromJson(errMap);
                    errorDescription = errorResponse.toJson();
                  } else {
                    errorDescription =
                        " Failed to load data - status code: ${error.response!.statusCode}";
                  }
                  break;
                default:
               /*    print('cfvgbhnaaaaaaaaaa');
                  print(error.response!.data);
                  print('hgnnnnnnnnnn');
                  print(error.response); */

                  ErrorResponseModel? errorResponse;
                  try {
                    errorResponse =
                        ErrorResponseModel.fromJson(error.response!.data);
                  } catch (e) {
                    if (kDebugMode) {
                      //print('error is -> ${e.toString()}');
                    }
                  }

                  if (errorResponse != null &&
                      errorResponse.errors != null &&
                      errorResponse.errors!.isNotEmpty) {
                    if (kDebugMode) {
                     /*  print(
                          'error----------------== ${errorResponse.errors![0].message} || error: ${error.response!.requestOptions.uri}'); */
                    }
                    errorDescription = errorResponse.toJson();
                  } else {
                    errorDescription =
                        "Failed to load data - status code: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioExceptionType.sendTimeout:
              errorDescription =
                  getTranslated('send_timeout_with_server', Get.context!);
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription =
                  getTranslated('send_timeout_with_server', Get.context!);
              // TODO: Handle this case.
              break;
            case DioExceptionType.badCertificate:
              errorDescription =
                  getTranslated('incorrect_certificate', Get.context!);
              // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
              errorDescription =
                  getTranslated('unavailable_to_process_data', Get.context!);
              // TODO: Handle this case.
              break;
            case DioExceptionType.unknown:
              /*    debugPrint(
                  'error----------------== ${error.response?.requestOptions.path} || ${error.response?.statusCode} ${error.response?.data}');

              errorDescription =
                  getTranslated('unavailable_to_process_data', Get.context!); */
              // TODO: Handle this case.
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
