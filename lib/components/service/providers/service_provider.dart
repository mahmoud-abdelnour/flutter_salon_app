import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/components/service/domain/models/service_model.dart';
import 'package:certain_salon/components/service/domain/reposotories/service_repo.dart';
import 'package:certain_salon/helper/api_checker_helper.dart';
import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  final ServiceRepo? serivceRepo;

  ServiceProvider({required this.serivceRepo});

  List<ServiceModel>? _servicesList;
  List<ServiceModel>? get servicesList => _servicesList;

  List<ServiceModel>? _homeServicesList;
  List<ServiceModel>? get homeServicesList => _homeServicesList;

  ServiceModel? _serviceDetails;
  ServiceModel? get serviceDetails => _serviceDetails;

  Future<void> getServicesList(BuildContext context) async {
    if (servicesList == null) {
      ApiResponseModel apiResponse = await serivceRepo!.getServicesList();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _servicesList = [];
        apiResponse.response!.data.forEach((service) {
          ServiceModel serviceModel = ServiceModel.fromJson(service);
          _servicesList?.add(serviceModel);
        });
      } else {
        ApiCheckerHelper.checkApi(apiResponse);
      }
      notifyListeners();
    }
  }

  Future<void> getHomeServicesList(BuildContext context) async {
    if (servicesList == null) {
      ApiResponseModel apiResponse = await serivceRepo!.getHomeServicesList();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _homeServicesList = [];
        apiResponse.response!.data.forEach((service) {
          ServiceModel serviceModel = ServiceModel.fromJson(service);
          _homeServicesList?.add(serviceModel);
        });
      } else {
        ApiCheckerHelper.checkApi(apiResponse);
      }
      notifyListeners();
    }
  }

  Future<void> getServicesDetails(BuildContext context,
      [String? serviceId]) async {
    _serviceDetails = null;
    ApiResponseModel apiResponse =
        await serivceRepo!.getServicesDetails(serviceId!);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _serviceDetails = ServiceModel.fromJson(apiResponse.response!.data);

      print("Service Details: ${_serviceDetails}");
      
    } else {
      ApiCheckerHelper.checkApi(apiResponse);
    }
    notifyListeners();
  }
}
