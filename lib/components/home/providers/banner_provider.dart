import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/components/home/domain/models/banner_model.dart';
import 'package:certain_salon/components/home/domain/reposotories/banner_repo.dart';
import 'package:certain_salon/helper/api_checker_helper.dart';
import 'package:flutter/material.dart';

class BannerProvider extends ChangeNotifier {
  final BannerRepo? bannerRepo;

  BannerProvider({required this.bannerRepo});

  List<BannerModel>? _bannerList;
  int _currentIndex = 0;

  List<BannerModel>? get bannerList => _bannerList;
  int get currentIndex => _currentIndex;

  Future<void> getBannerList(BuildContext context) async {
    if (bannerList == null) {
      ApiResponseModel apiResponse = await bannerRepo!.getBannerList();
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
