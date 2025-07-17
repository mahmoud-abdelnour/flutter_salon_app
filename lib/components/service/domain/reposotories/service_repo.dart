import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/network/api_error_handling.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/endpoints.dart';

class ServiceRepo {
  final DioClient? dioClient;
  ServiceRepo({required this.dioClient});

  Future<ApiResponseModel> getServicesList() async {
    try {
      final response = await dioClient!.get(EndPoints.servicesUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getHomeServicesList() async {
    try {
      final response = await dioClient!.get(EndPoints.homeServicesUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getServicesDetails(String serviceId) async {
    try {
      String params = serviceId;

      final response = await dioClient!.get('${EndPoints.servicesDetailsUri}?service_id=$params');
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
