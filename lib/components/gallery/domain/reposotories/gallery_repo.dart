
import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/network/api_error_handling.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/endpoints.dart';

class GalleryRepo {
  final DioClient? dioClient;
  GalleryRepo({required this.dioClient});

  Future<ApiResponseModel> getGalleryList() async {
    try {
      final response = await dioClient!.get(EndPoints.galleryUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

}