import 'package:certain_salon/common/widgets/custom_button.dart';
import 'package:certain_salon/common/widgets/custom_button_widget.dart';
import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/common/widgets/custom_text.dart';
import 'package:certain_salon/common/widgets/custom_text_style.dart';
import 'package:certain_salon/components/appointment/providers/appointment_provider.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/components/home/components/profile.dart';
import 'package:certain_salon/components/home/screens/home_screen.dart';
import 'package:certain_salon/localization/app_localization.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/theme/custom_theme.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:certain_salon/util/images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuestAppointmentScreen extends StatefulWidget {
  const GuestAppointmentScreen({super.key});

  @override
  State<GuestAppointmentScreen> createState() => _GuestAppointmentScreenState();
}

class _GuestAppointmentScreenState extends State<GuestAppointmentScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((ss) {
      _initLoadGuestAppointment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentProvider>(
        builder: (context, appoinmtentProvider, child) {
      return ListView(
        padding: CustomSpacing.xy(20, 50),
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: CustomSpacing.y(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CustomText.titleLarge(
                          'تأكيد الحجز',
                        ),
                      ),
                      CustomSpacing.height(50),
                      CustomText.titleMedium(
                        'التاريخ',
                        fontWeight: 800,
                      ),
                      CustomSpacing.height(3),
                      CustomText.titleMedium(
                        '${appoinmtentProvider.guestAppointmentModel?.appointmentDate}',
                        color: customTheme.disabledColor,
                      ),
                      CustomSpacing.height(20),
                      Container(
                          margin: CustomSpacing.fromLTRB(0, 0, 0, 0),
                          child: const Divider(
                            height: 0,
                          )),
                      CustomSpacing.height(20),
                      CustomText.titleMedium(
                        'الوقت',
                        fontWeight: 800,
                      ),
                      CustomSpacing.height(3),
                      CustomText.titleMedium(
                        '${appoinmtentProvider.guestAppointmentModel?.timeSlotFormatted}',
                        color: customTheme.disabledColor,
                      ),
                      CustomSpacing.height(20),
                      Container(
                          margin: CustomSpacing.fromLTRB(0, 0, 0, 0),
                          child: const Divider(
                            height: 0,
                          )),
                      CustomSpacing.height(20),
                      CustomText.titleMedium(
                        'الخدمة',
                        fontWeight: 800,
                      ),
                      CustomSpacing.height(3),
                      CustomText.titleMedium(
                        '${appoinmtentProvider.guestAppointmentModel?.serviceName}',
                        color: customTheme.disabledColor,
                      ),
                      CustomSpacing.height(20),
                      Container(
                          margin: CustomSpacing.fromLTRB(0, 0, 0, 0),
                          child: const Divider(
                            height: 0,
                          )),
                      CustomSpacing.height(20),
                      CustomText.titleMedium(
                        'الموظفة',
                        fontWeight: 800,
                      ),
                      CustomSpacing.height(3),
                      CustomText.titleMedium(
                        '${appoinmtentProvider.guestAppointmentModel?.employeeName}',
                        color: customTheme.disabledColor,
                      ),
                      CustomSpacing.height(50),
                      CustomButton.rounded(
                          elevation: 0,
                          padding: CustomSpacing.y(20),
                          //backgroundColor: customTheme.colorWarning,
                          backgroundColor: theme.primaryColor,
                          //buttonType:CustomButtonType.elevated  ,
                          borderColor: theme.dividerColor,
                          borderRadiusAll: AppConstants.buttonRadius.small,
                          block: true,
                          onPressed: () {},
                          child: CustomText(
                            'تأكيد الحجز',
                            fontSize: 15,
                            color: customTheme.onInfo,
                          )),
                      CustomSpacing.height(20),
                      CustomButton.outlined(
                        borderColor: theme.dividerColor,
                        //borderColor: customTheme.colorInfo,
                        backgroundColor: customTheme.card,
                        borderRadiusAll: AppConstants.buttonRadius.small,
                        onPressed: () {
                          context.pop();
                          //GoRouter.of(context).go('/a');
                        },
                        block: true,
                        padding: CustomSpacing.y(12),
                        child: CustomText.labelLarge(
                          "إلغاء الحجز",
                          color: theme.primaryColor,
                        ),
                      ),

                      /* 

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText.titleSmall('sasa',
                                    color: theme.colorScheme.onSurface,
                                    fontWeight: 600),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: CustomSpacing.all(6),
                                    child: Icon(
                                      LucideIcons.qrCode,
                                      color: theme.colorScheme.onSurface.withAlpha(200),
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: CustomSpacing.top(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText.bodySmall("Date",
                                          fontWeight: 600,
                                          letterSpacing: 0,
                                          fontSize: 12,
                                          color: theme.colorScheme.onSurface,
                                          xMuted: true),
                                      Container(
                                        margin: CustomSpacing.top(2),
                                        child: CustomText.bodyMedium("2025-02-05",
                                            color: theme.colorScheme.onSurface),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText.bodySmall("Time",
                                          fontWeight: 600,
                                          letterSpacing: 0,
                                          color: theme.colorScheme.onSurface,
                                          fontSize: 12,
                                          xMuted: true),
                                      Container(
                                        margin: CustomSpacing.top(2),
                                        child: CustomText.bodyMedium("08:15 PM",
                                            color: theme.colorScheme.onSurface),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          
        */
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      );
    });
  }

  Future<void> _initLoadGuestAppointment() async {
    final appointmentProvider =
        Provider.of<AppointmentProvider>(context, listen: false);
    appointmentProvider.loadGuestAppointment();
  }
}


/* 
CustomText.titleMedium('التاريخ',
  //color: customTheme.disabledColor,
)

 CustomText.titleMedium('2025-02-05',
  color: customTheme.disabledColor,
) */