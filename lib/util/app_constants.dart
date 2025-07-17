import 'package:flutter/material.dart';

import 'package:certain_salon/common/models/language_model.dart';

class AppConstants {
  static const String appName = "Certain Salon";
  static const String fontFamily = "Almarai";
  static const String baseUrl = "api_url";
  static const String token = "token";
  static const String configUri = "";
  static const String languageCode = "language_code";
  static const String countryCode = "country_code";
  static const String theme = "theme";
  static const String onBoardingSkip = "on_boarding_skip";
  static const String userLogData = "user_log_data";
  
  static const String stroredSelectedDate = "stroredSelectedDate";
  static const String stroredSelectedService = "stroredSelectedService";
  static const String stroredSelectedEmployee = "stroredSelectedEmployee";
  static const String stroredSelectedTimeSlot = "stroredSelectedTimeSlot";
  static const String stroredSelectedServiceId = "stroredSelectedServiceId";
  static const String stroredSelectedEmployeeId = "stroredSelectedEmployeeId";
  static const String stroredSelectedTimeSlotFortmatted = "stroredSelectedTimeSlotFortmatted";




  static List<LanguageModel> languages = [
      LanguageModel(languageName: "عربي",countryCode: "SA" ,languageCode: "ar"),
      LanguageModel(languageName: "English",countryCode: "US" ,languageCode: "en")
  ];

  static CustomRadius buttonRadius =  CustomRadius(xs: 4, small: 8, medium: 16, large: 24);
  static CustomRadius textFieldRadius = CustomRadius(xs: 4, small: 8, medium: 16, large: 24);
  static CustomRadius containerRadius =  CustomRadius(xs: 4, small: 8, medium: 16, large: 24);
  static CustomRadius cardRadius =  CustomRadius(xs: 4, small: 8, medium: 16, large: 24);



  
}

class CustomRadius {
  late double xs, small, medium, large;

  CustomRadius(
      {this.xs = 4, this.small = 8, this.medium = 16, this.large = 24});
}