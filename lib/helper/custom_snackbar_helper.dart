import 'package:certain_salon/main.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/styles.dart';
import 'package:flutter/material.dart';

void showCustomSnackBarHelper(String message,
    {bool isError = true,
    Duration? duration,
    Widget? content,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding}) {
  //ScaffoldMessenger.of(Get.context!).clearSnackBars();
  final double width = MediaQuery.of(Get.context!).size.width;
  ScaffoldMessenger.of(Get.context!)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        key: UniqueKey(),
        content: content ??
            Text(
              message,
              style: almaraiLight.copyWith(color: Colors.white),
            ),
        margin: margin != null
            ? EdgeInsets.only(
                right: width * 0.75,
                bottom: Dimensions.paddingSizeLarge,
                left: Dimensions.paddingSizeExtraSmall,
              )
            : null,
        duration: duration ?? const Duration(milliseconds: 4000),
        behavior: SnackBarBehavior.fixed,
        dismissDirection: DismissDirection.down,
        backgroundColor:
            backgroundColor ?? (isError ? Colors.red : Colors.green),
        padding: padding,
      ),
    );
}
