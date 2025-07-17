import 'package:certain_salon/common/widgets/custom_button_widget.dart';
import 'package:certain_salon/localization/app_localization.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/util/images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppointmentSuccessScreen extends StatelessWidget {
  const AppointmentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,

      
      child:
     CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: customTheme.colorSuccess,
                  size: 103,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  'تم حجز الموعد بنجاح'.tr,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.023),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                SizedBox(
                  width: 150,
                  height: 45,
                  child: CustomButtonWidget(
                      buttonText: 'حجوازاتي'.tr,
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                        context.pop(true);
                        context.go('/d/user_appointments');


                      }),
                ),
              ],
            ),
          ),
        ),
      )),
    ])
    );
  }
}
