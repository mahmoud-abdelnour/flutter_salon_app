import 'package:certain_salon/common/widgets/custom_button.dart';
import 'package:certain_salon/common/widgets/custom_container.dart';
import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/common/widgets/custom_text.dart';
import 'package:certain_salon/common/widgets/custom_text_style.dart';
import 'package:certain_salon/components/appointment/domain/models/employee_model.dart';
import 'package:certain_salon/components/appointment/domain/models/service_model.dart';
import 'package:certain_salon/components/appointment/domain/models/time_slot_model.dart';
import 'package:certain_salon/components/appointment/domain/models/user_appointment_model.dart';
import 'package:certain_salon/components/appointment/providers/appointment_provider.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/images.dart';
import 'package:certain_salon/util/styles.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class UserAppointmentsScreen extends StatefulWidget {
  UserAppointmentsScreen({super.key});

  final _UserAppointmentsScreenState myAppState =
      _UserAppointmentsScreenState();

  @override
  State<UserAppointmentsScreen> createState() => _UserAppointmentsScreenState();

  static Future<void> loadData(BuildContext context) async {
    Provider.of<AppointmentProvider>(context, listen: false)
        .getUserAppointments(context);
  }

  void sshowDialog(int? appointmentId) {
    myAppState.sshowDialog(appointmentId);
  }
}

class _UserAppointmentsScreenState extends State<UserAppointmentsScreen> {
  ThemeData theme = AppTheme.theme;

  @override
  void initState() {
    print("holaaaaaaaaaaa here is user appointment page ");
    UserAppointmentsScreen.loadData(context);
    super.initState();
  }

  void sshowDialog(int? appointmentId) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            _TermsDialog(appointmentId: appointmentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('حجوزاتي'),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: CustomSpacing.all(Dimensions.paddingSizeDefault),
              child: Consumer<AppointmentProvider>(
                  builder: (context, appointmentProvider, child) {
                return appointmentProvider.userAppointmentList != null
                    ? appointmentProvider.userAppointmentList!.isNotEmpty
                        ? GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            //physics: BouncingScrollPhysics(),
                            physics: const ClampingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 3.1,
                              crossAxisCount: 1,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 0,
                            ),
                            itemCount:
                                appointmentProvider.userAppointmentList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var appointment = appointmentProvider
                                  .userAppointmentList![index];

                              return _singleAppointment(
                                  appointment: appointment,
                                  appointmentProvider: appointmentProvider);
                            })
                            
                             
                        :  Center(
                                child: CustomText.bodyLarge(
                                  'لا يوجد حجوزات',
                                  color: customTheme.disabledColor,
                                ),
                              )
                    : Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).primaryColor),
                          strokeWidth: 3,
                        ),
                      );

                /* 
                return Column(
                  children: [
                    /* CustomContainer.bordered(
                            onTap: () {
                              ///controller.goToSingleCoinScreen(coin);
                            },
                            paddingAll: 12,
                            margin: CustomSpacing.bottom(20),
                            borderRadiusAll: AppConstants.containerRadius.small,
                            //color: theme.hoverColor,
                            //color: theme.colorScheme.tertiaryFixed,
                            borderColor:theme.colorScheme.tertiaryFixedDim,
                            borderWidth:.5,
                            child: Row(
                              children: [
                              // const Image( height: 32, width: 32, image: AssetImage(Images.appLogo)),
                                Icon(
                                  Icons.calendar_month  ,
                                  color: theme.colorScheme.error,
                                  size: 26,
                                ),
                                CustomSpacing.width(12),
                                Expanded(
                                  child: Column(
                                    //textBaseline:TextBaseline.alphabetic,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Row(
                                        children: [
                                          Text('مكياج'),
                                          CustomSpacing.width(12),
                                          Text('-'),
                                          CustomSpacing.width(12),
                                          Text('سلمي'),
                                        ],
                                      ),
                                      CustomSpacing.height(4),
                                      const Text('2024-01-02  5 ص'),
                                    ],
                                  ),
                                ),
                                
                                CustomContainer(
                                  color: theme.colorScheme.tertiaryFixed,
                                  //color: theme.colorScheme.primaryContainer,
                                  padding: CustomSpacing.xy(16, 8),
                                  borderRadiusAll: AppConstants.containerRadius.large,
                                  child: Text('bbbbb'),
                                ),
                              ],
                            ),
                          ), */

                    CustomContainer.bordered(
                      onTap: () {
                        ///controller.goToSingleCoinScreen(coin);
                      },
                      paddingAll: 12,
                      margin: CustomSpacing.bottom(20),
                      borderRadiusAll: AppConstants.containerRadius.small,
                      color: customTheme.colorSuccessLight,
                      //color: theme.colorScheme.tertiaryFixed,
                      borderColor: customTheme.colorSuccess,
                      borderWidth: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                //padding: CustomSpacing.all(0 ),
                                child: Row(
                                  children: [
                                    CustomContainer(
                                      padding: CustomSpacing.all(5),
                                      margin:
                                          CustomSpacing.fromLTRB(5, 0, 0, 0),
                                      //color: Colors.transparent,
                                      child: Icon(
                                        LucideIcons.wand2,
                                        color: theme.colorScheme.onSurface
                                            .withAlpha(200),
                                        size: 13,
                                      ),
                                    ),
                                    CustomText.titleSmall('قص طويل',
                                        color: theme.colorScheme.onSurface,
                                        fontSize: 12,
                                        fontWeight: 700)
                                  ],
                                ),
                              ),
                              Container(
                                //padding: CustomSpacing.all(0 ),
                                child: Row(
                                  children: [
                                    CustomContainer(
                                      padding: CustomSpacing.all(5),
                                      margin:
                                          CustomSpacing.fromLTRB(5, 0, 0, 0),
                                      //color: Colors.transparent,

                                      child: Icon(
                                        LucideIcons.user,
                                        color: theme.colorScheme.onSurface
                                            .withAlpha(200),
                                        size: 13,
                                      ),
                                    ),
                                    CustomText.titleSmall('حصه العتيبي',
                                        color: theme.colorScheme.onSurface,
                                        fontSize: 12,
                                        fontWeight: 700)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: CustomSpacing.top(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText.bodySmall("التاريخ",
                                        fontWeight: 600,
                                        letterSpacing: 0,
                                        fontSize: 12,
                                        color: theme.colorScheme.onSurface,
                                        xMuted: true),
                                    Container(
                                      margin: CustomSpacing.top(2),
                                      child: CustomText.bodyMedium("2025-02-05",
                                          fontSize: 13,
                                          fontWeight: 700,
                                          color: theme.colorScheme.onSurface),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText.bodySmall("الوقت",
                                        fontWeight: 600,
                                        letterSpacing: 0,
                                        color: theme.colorScheme.onSurface,
                                        fontSize: 12,
                                        xMuted: true),
                                    Container(
                                      margin: CustomSpacing.top(2),
                                      child: CustomText.bodyMedium("05:00 ص",
                                          fontSize: 13,
                                          fontWeight: 700,
                                          color: theme.colorScheme.onSurface),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 40,
                                  height: 25,
                                  child: CustomButton.small(
                                      elevation: 0,
                                      backgroundColor: customTheme.colorError,
                                      padding: CustomSpacing.xy(2, 0),
                                      buttonType: CustomButtonType.elevated,
                                      borderColor: theme.dividerColor,
                                      borderRadiusAll:
                                          AppConstants.buttonRadius.xs,
                                      //borderRadiusAll:5,
                                      onPressed: () {},
                                      child: CustomText.bodySmall(
                                        'إلغاء',
                                        fontSize: 11,
                                        color: theme.cardColor,
                                        fontWeight: 800,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ); */
              }),
            ),
            CustomSpacing.height(20),
          ]),
        ));
  }
}

class _singleAppointment extends StatelessWidget {
  final UserAppointmentModel appointment;
  final AppointmentProvider appointmentProvider;

  const _singleAppointment(
      {super.key,
      required this.appointmentProvider,
      required this.appointment});

  void _showDialog(int? appointmentId, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            _TermsDialog(appointmentId: appointmentId));
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer.bordered(
      onTap: () {
        ///controller.goToSingleCoinScreen(coin);
      },
      paddingAll: 12,
      margin: CustomSpacing.bottom(20),
      borderRadiusAll: AppConstants.containerRadius.small,
      color: customTheme.colorSuccessLight,
      //color: theme.colorScheme.tertiaryFixed,
      borderColor: customTheme.colorSuccess,
      borderWidth: 1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //padding: CustomSpacing.all(0 ),
                child: Row(
                  children: [
                    CustomContainer(
                      padding: CustomSpacing.all(5),
                      margin: CustomSpacing.fromLTRB(5, 0, 0, 0),
                      //color: Colors.transparent,
                      child: Icon(
                        LucideIcons.wand2,
                        color: theme.colorScheme.onSurface.withAlpha(200),
                        size: 13,
                      ),
                    ),
                    CustomText.titleSmall(' ${appointment.service?.name}',
                        color: theme.colorScheme.onSurface,
                        fontSize: 12,
                        fontWeight: 700)
                  ],
                ),
              ),
              Container(
                //padding: CustomSpacing.all(0 ),
                child: Row(
                  children: [
                    CustomContainer(
                      padding: CustomSpacing.all(5),
                      margin: CustomSpacing.fromLTRB(5, 0, 0, 0),
                      //color: Colors.transparent,

                      child: Icon(
                        LucideIcons.user,
                        color: theme.colorScheme.onSurface.withAlpha(200),
                        size: 13,
                      ),
                    ),
                    CustomText.titleSmall(
                        //'حصه العتيبي',
                        '${appointment.employee?.name}',
                        color: theme.colorScheme.onSurface,
                        fontSize: 12,
                        fontWeight: 700)
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: CustomSpacing.top(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.bodySmall("التاريخ",
                        fontWeight: 600,
                        letterSpacing: 0,
                        fontSize: 12,
                        color: theme.colorScheme.onSurface,
                        xMuted: true),
                    Container(
                      margin: CustomSpacing.top(2),
                      child: CustomText.bodyMedium(
                          //"2025-02-05",
                          '${appointment.appointmentDate}',
                          fontSize: 13,
                          fontWeight: 700,
                          color: theme.colorScheme.onSurface),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.bodySmall("الوقت",
                        fontWeight: 600,
                        letterSpacing: 0,
                        color: theme.colorScheme.onSurface,
                        fontSize: 12,
                        xMuted: true),
                    Container(
                      margin: CustomSpacing.top(2),
                      child: CustomText.bodyMedium(
                          //"05:00 ص",
                          '${appointment.timeText}',
                          fontSize: 13,
                          fontWeight: 700,
                          color: theme.colorScheme.onSurface),
                    )
                  ],
                ),
                appointment.validAppointment == 1
                    ? Container(
                        width: 40,
                        height: 25,
                        child: CustomButton.small(
                            elevation: 0,
                            backgroundColor: customTheme.colorError,
                            padding: CustomSpacing.xy(2, 0),
                            buttonType: CustomButtonType.elevated,
                            borderColor: theme.dividerColor,
                            borderRadiusAll: AppConstants.buttonRadius.xs,
                            //borderRadiusAll:5,
                            onPressed: () {
                              //UserAppointmentsScreen.sshowDialog(appointment.id);
                              _showDialog(appointment.id, context);
                            },
                            child: CustomText.bodySmall(
                              'إلغاء',
                              fontSize: 11,
                              color: theme.cardColor,
                              fontWeight: 800,
                            )),
                      )
                    : Text("")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TermsDialog extends StatelessWidget {
  final int? appointmentId;

  const _TermsDialog({this.appointmentId});

  void _cancelAppointment(BuildContext context, int? appointmentId) {
    //Provider.of<AppointmentProvider>(context, listen: false).getServicesList(context);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.theme;

    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: CustomText.titleLarge("إلغاء موعد", fontWeight: 800),
                  ),
                ),
                const Icon(Icons.highlight_remove_rounded)
              ],
            ),
            Divider(),
            Container(
                margin: const EdgeInsets.only(top: 8),
                child: CustomText.titleSmall("هل تريد إلغاء الموعد")),
            Container(
                margin: const EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomButton.text(
                        borderRadiusAll: 4,
                        elevation: 2,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: CustomText.bodyMedium("إغلاق",
                            fontWeight: 600, color: theme.colorScheme.primary)),
                    CustomButton(
                        elevation: 2,
                        borderRadiusAll: 4,
                        onPressed: () {
                          Provider.of<AppointmentProvider>(context,
                                  listen: false)
                              .cancelAppointment(context, appointmentId)
                              .then((value) {
                            Navigator.pop(context);
                          });
                        },
                        child: CustomText.bodyMedium("إلغاء موعد",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
