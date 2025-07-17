import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/network/api_error_handling.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/endpoints.dart';

class BannerRepo {
  final DioClient? dioClient;
  BannerRepo({required this.dioClient});

  Future<ApiResponseModel> getBannerList() async {
    try {
      final response = await dioClient!.get(EndPoints.bannerUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      print("eeeeeeeerrrr");
      print(ApiErrorHandler.getMessage(e));
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
