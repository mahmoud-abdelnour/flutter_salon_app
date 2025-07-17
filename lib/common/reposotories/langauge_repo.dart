import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/common/models/language_model.dart';
import 'package:certain_salon/network/api_error_handling.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class LanguageRepo {
  final DioClient? dioClient;

  LanguageRepo({required this.dioClient});

  List<LanguageModel> getAllLanguages({BuildContext? context}) {
    return AppConstants.languages;
  }


}
