import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/network/api_error_handling.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/endpoints.dart';

class AppointmentRepo {
  final DioClient? dioClient;
  AppointmentRepo({required this.dioClient});

  Future<ApiResponseModel> getEmployeesList(selectedServiceId) async {
    try {
      Map<String, dynamic> parameters = <String, dynamic>{};
      parameters['service_id'] = selectedServiceId;
      final response = await dioClient!
          .get(EndPoints.employeesUri, queryParameters: parameters);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getServicesList() async {
    try {
      final response = await dioClient!.get(EndPoints.servicesUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getTimeSlotsList(parameter) async {
    try {
      final response = await dioClient!
          .get(EndPoints.getTimeSlots, queryParameters: parameter);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> makeAppointment(dataa) async {
    try {
      print("hiiiiii");
      final response = await dioClient!.post(EndPoints.makeAppointment, data: dataa);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      print("eeeeeeee");
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getUserAppointments() async {
    try {
      final response = await dioClient!.post(EndPoints.userAppointmentsUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

    Future<ApiResponseModel> cancelAppointment(data) async {
    try {
      final response = await dioClient!.post(EndPoints.cancelAppointment,data: data);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }


}
