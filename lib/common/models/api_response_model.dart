import 'package:dio/dio.dart';

class ApiResponseModel {
  final Response? response;
  final dynamic error;

  ApiResponseModel( this.response, this.error);

  ApiResponseModel.withSuccess(Response responseValue):response = responseValue,error = null;
  ApiResponseModel.withError(dynamic errorvalue):error = errorvalue,response = null;

}
