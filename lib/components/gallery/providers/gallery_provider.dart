import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/components/gallery/domain/reposotories/gallery_repo.dart';
import 'package:certain_salon/components/home/domain/models/banner_model.dart';
import 'package:certain_salon/components/home/domain/reposotories/banner_repo.dart';
import 'package:certain_salon/helper/api_checker_helper.dart';
import 'package:flutter/material.dart';

class GalleryProvider extends ChangeNotifier {
  final GalleryRepo? galleryRepo;

  GalleryProvider({required this.galleryRepo});

  List<BannerModel>? _bannerList;
  int _currentIndex = 0;

  List<BannerModel>? get bannerList => _bannerList;
  int get currentIndex => _currentIndex;

  Future<void> getGalleryList(BuildContext context) async {
    if (bannerList == null) {
      ApiResponseModel apiResponse = await galleryRepo!.getGalleryList();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
         _bannerList = [];
       
        apiResponse.response!.data.forEach((banner) {
          BannerModel bannerModel = BannerModel.fromJson(banner);
          _bannerList?.add(bannerModel);
        });
      } else {
        ApiCheckerHelper.checkApi(apiResponse);
      }
      notifyListeners();
    }
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
