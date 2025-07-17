import 'dart:async';
import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/common/models/config_model.dart';

import 'package:certain_salon/components/splash/domain/reposotories/SplashRepo.dart';
import 'package:certain_salon/helper/api_checker_helper.dart';
import 'package:certain_salon/main.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo? splashRepo;
  SplashProvider({required this.splashRepo});

  ConfigModel? _configModel;
  BaseUrls? _baseUrls;
  int _pageIndex = 0;
  bool _fromSetting = false;
  bool _firstTimeConnectionCheck = true;
  //List<MainScreenModel> _screenList = [];

  //List<MainScreenModel> get screenList => _screenList;
  ConfigModel? get configModel => _configModel;
  BaseUrls? get baseUrls => _baseUrls;
  int get pageIndex => _pageIndex;
  bool get fromSetting => _fromSetting;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

 

  Future<bool> initConfig() async {
    ApiResponseModel apiResponse = await splashRepo!.getConfig();
    bool isSuccess;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //print("hello from success api call ");
      //print(apiResponse.response!.data);

      _configModel = ConfigModel.fromJson(apiResponse.response!.data);
      //_baseUrls = ConfigModel.fromJson(apiResponse.response!.data).baseUrls;

      isSuccess = true;

/* 
      if(Get.context != null) {
        final AuthProvider authProvider = Provider.of<AuthProvider>(Get.context!, listen: false);

        if(authProvider.getGuestId() == null && !authProvider.isLoggedIn()){
          authProvider.addOrUpdateGuest();
        }
      } */

      notifyListeners();
    } else {
      isSuccess = false;
      //showCustomSnackBarHelper(apiResponse.error.toString(), isError: true);
    }
    return isSuccess;
  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }

  /* Future<void> getHomeScreenData(BuildContext? context) async {
    if (_serviceList == null) {
      ApiResponseModel apiResponse = await splashRepo!.getHomeScreenData();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _serviceList = [];

        print('hello i have loaded home data successfulluy');

          apiResponse.response!.data.forEach((banner) {
            BannerModel bannerModel = BannerModel.fromJson(banner);
            _serviceList?.add(bannerModel);
          });
      } else {
        ApiCheckerHelper.checkApi(apiResponse);
      }

      notifyListeners();
    }
  } */

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  Future<bool> initSharedData() {
    return splashRepo!.initSharedData();
  }

  Future<bool> removeSharedData() {
    return splashRepo!.removeSharedData();
  }

  void setFromSetting(bool isSetting) {
    _fromSetting = isSetting;
  }

  String? getLanguageCode() {
    return splashRepo!.sharedPreferences!.getString(AppConstants.languageCode);
  }

  bool showIntro() {
    return splashRepo!.showIntro();
  }

  void disableIntro() {
    splashRepo!.disableIntro();
  }

  void initializeScreenList(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);

    /* _screenList = [
      
    ]; */
  }
}
