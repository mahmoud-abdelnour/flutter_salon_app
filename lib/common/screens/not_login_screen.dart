import 'package:certain_salon/common/widgets/custom_button_widget.dart';
import 'package:certain_salon/localization/app_localization.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/util/images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotLoggedInScreen extends StatelessWidget {
  const NotLoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
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
                        Icons.person_2_outlined,
                        color: theme.colorScheme.primary,
                        size: 103,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                Text(
                  'guest_mode'.tr,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.023),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                Text(
                  'now_you_are_in_guest_mode'.tr,
                  style: TextStyle(
                  
                      fontSize: MediaQuery.of(context).size.height * 0.0175,height:2),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                SizedBox(
                  width: 150,
                  height: 45,
                  child: CustomButtonWidget(
                      buttonText: 'login'.tr,
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                        context.pushNamed('login');
                      }),
                ),
                
              ],
            ),
          ),
        ),
      )),
    ]);
  }
}
