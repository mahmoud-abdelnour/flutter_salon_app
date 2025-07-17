import 'package:certain_salon/common/widgets/custom_image_widget.dart';
import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/components/appointment/domain/models/employee_model.dart';
import 'package:certain_salon/components/appointment/domain/models/service_model.dart';
import 'package:certain_salon/components/appointment/providers/appointment_provider.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/images.dart';
import 'package:certain_salon/util/styles.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({super.key, this.serviceId});
  final dynamic? serviceId;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();

  static Future<void> loadData(BuildContext context) async {
    /* Provider.of<AppointmentProvider>(context, listen: false)
        .getEmployeesList(context, null); */

    /* String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    _selectedDate = formattedDate; */

    var dcfv =
        Provider.of<AppointmentProvider>(context, listen: false).selectedDate;

    print('dcfv');
    print(dcfv);

    Provider.of<AppointmentProvider>(context, listen: false)
        .getServicesList(context);
  }
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late ThemeData theme;
  var selectedRole = 1;
  final dataKey = GlobalKey();
  final timeSlotKey = GlobalKey();
  final reserveButtonKey = GlobalKey();
  final dateKey = GlobalKey();

  late dynamic selectedDate;
  late dynamic selectedService;
  late dynamic selectedEmployee = 0;
  late dynamic selectedTimeSlot;

  @override
  void initState() {
    AppointmentScreen.loadData(context);
    //print('sssssssssqqqqqqqqqqqqqqqq');
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((ss) {
      if (widget.serviceId != null) {
        Provider.of<AppointmentProvider>(context, listen: false)
            .setSelectedService(widget.serviceId);
      }

      /*  Provider.of<AppointmentProvider>(context, listen: false)
            .setSelectedDate(DateTime.now()); */

      //print(dataKey.currentContext);
      //Scrollable.ensureVisible(dataKey.currentContext!);
    });
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('حجز موعد'),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Consumer<AppointmentProvider>(
                builder: (context, appointmentProvider, child) {
              return EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    /*     print(selectedDate.runtimeType);
                      print(selectedDate); */
                    appointmentProvider.setSelectedDate(selectedDate);
                  },
                  locale: "ar",
                  key: dateKey);
            }),
            CustomSpacing.height(20),
            Padding(
              padding: CustomSpacing.all(Dimensions.paddingSizeDefault),
              child: const Text(
                'اختر الخدمة',
                style: TextStyle(
                    fontSize: Dimensions.fontSizeExtraLarge,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: CustomSpacing.x(Dimensions.paddingSizeDefault),
              child: Consumer<AppointmentProvider>(
                  builder: (context, appointmentProvider, child) {
                return appointmentProvider.servicesList != null
                    ? appointmentProvider.servicesList!.isNotEmpty
                        ? GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            //physics: BouncingScrollPhysics(),
                            physics: const ClampingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.1,
                              crossAxisCount: 3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount: appointmentProvider.servicesList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return singleService(
                                  serviceItem:
                                      appointmentProvider.servicesList![index],
                                  appointmentProvider: appointmentProvider);
                            })
                        : const Text('No services')
                    : Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).primaryColor),
                          strokeWidth: 3,
                        ),
                      );
              }),
            ),
            CustomSpacing.height(20),
            Padding(
              padding: CustomSpacing.all(Dimensions.paddingSizeDefault),
              child: const Text(
                'اختر الموظفة',
                style: TextStyle(
                    fontSize: Dimensions.fontSizeExtraLarge,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              key: dataKey,
              padding: CustomSpacing.x(Dimensions.paddingSizeDefault),
              child: Consumer<AppointmentProvider>(
                  builder: (context, appointmentProvider, child) {
                return appointmentProvider.employeesList != null
                    ? appointmentProvider.employeesList!.isNotEmpty
                        ? GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            //physics: BouncingScrollPhysics(),
                            physics: const ClampingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.1,
                              crossAxisCount: 3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount:
                                appointmentProvider.employeesList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return singleEmp(
                                  empItem:
                                      appointmentProvider.employeesList![index],
                                  appointmentProvider: appointmentProvider);
                            })
                        : const Text('No employees')
                    : Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).primaryColor),
                          strokeWidth: 3,
                        ),
                      );
              }),
            ),
            CustomSpacing.height(20),
            Padding(
              padding: CustomSpacing.all(Dimensions.paddingSizeDefault),
              child: const Text(
                'اختر الوقت',
                style: TextStyle(
                    fontSize: Dimensions.fontSizeExtraLarge,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              key: timeSlotKey,
              padding: CustomSpacing.x(Dimensions.paddingSizeDefault),
              child: Consumer<AppointmentProvider>(
                  builder: (context, appointmentProvider, child) {
                return appointmentProvider.timeSlotsList != null
                    ? appointmentProvider.timeSlotsList!.isNotEmpty
                        ? GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            //physics: BouncingScrollPhysics(),
                            physics: const ClampingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount:
                                appointmentProvider.timeSlotsList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return singleTimeSLot(index,
                                  appointmentProvider: appointmentProvider,
                                  timeSLot: appointmentProvider
                                      .timeSlotsList![index]);
                            })
                        : const Text('No time slots')
                    : Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).primaryColor),
                          strokeWidth: 3,
                        ),
                      );
              }),
            ),
            CustomSpacing.height(20),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Consumer<AppointmentProvider>(
                        builder: (context, appointmentProvider, child) {
                      return FilledButton(
                        style: ButtonStyle(
                          visualDensity: VisualDensity.compact,
                          backgroundColor:
                              WidgetStatePropertyAll(theme.colorScheme.primary),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                          padding:
                              const WidgetStatePropertyAll(EdgeInsets.all(20)),
                        ),
                        onPressed: () {
                          appointmentProvider
                              .makeAppointment(context)
                              .then((res) {
                                  
                                  Scrollable.ensureVisible(dateKey.currentContext!);
                              });
                        
                        },
                        key: reserveButtonKey,
                        child: Text("حجز موعد",
                            style: almaraiExtraBold.copyWith(
                                fontSize: Dimensions.fontSizeLarge)),
                      );
                    }),
                  ),
                ),
              ],
            ),
            CustomSpacing.height(10),
          ]),
        ));
  }

  Widget singleService(
      {required ServiceModel serviceItem,
      required AppointmentProvider appointmentProvider}) {


    return Material(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () {
          appointmentProvider.setSelectedService(
              serviceItem.id, serviceItem.name);

          //print(dataKey.currentContext);

          Scrollable.ensureVisible(dataKey.currentContext!);
        },
        child: Container(
          //width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: theme.scaffoldBackgroundColor, spreadRadius: 8),
              ],
              color: theme.primaryColorLight ,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: appointmentProvider.selectedService == serviceItem.id
                      ? theme.primaryColorDark
                      : Colors.transparent,
                  width: 1)),
          padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
          margin: const EdgeInsets.all(0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    
                    //child: Image.asset(Images.student, height: 50, width: 50),
                    child: CustomImageWidget(
                                    width: 50,
                                    height: 50,
                                    image:'${serviceItem.serviceIcon}'
                                  ),
                  ),
                  CustomSpacing.height(10),
                  Text(
                    '${serviceItem.name}',
                    style: TextStyle(
                        color: selectedRole != 1
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
              appointmentProvider.selectedService == serviceItem.id
                  ? Positioned(
                      right: 0,
                      top: -10,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: theme.primaryColorDark,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8))),
                        child: Icon(
                          Icons.check,
                          color: theme.colorScheme.onPrimary,
                          size: 13,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleEmp(
      {required EmployeeModel empItem,
      required AppointmentProvider appointmentProvider}) {
    return Material(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () {
          appointmentProvider.setSelectedEmp(empItem.id, empItem.firstName);
          Scrollable.ensureVisible(timeSlotKey.currentContext!);
        },
        child: Container(
          //width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: theme.scaffoldBackgroundColor, spreadRadius: 8),
              ],
              color: theme.primaryColorLight ,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: appointmentProvider.selectedEmp == empItem.id
                      ? theme.primaryColorDark
                      : Colors.transparent,
                  width: 1)),
          padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
          margin: const EdgeInsets.all(0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(Images.employee, height: 50, width: 50),
                  ),
                  CustomSpacing.height(10),
                  Text(
                    '${empItem.firstName}',
                    style: TextStyle(
                        color: selectedRole != 1
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
              appointmentProvider.selectedEmp == empItem.id
                  ? Positioned(
                      right: 0,
                      top: -10,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: theme.primaryColorDark,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8))),
                        child: Icon(
                          Icons.check,
                          color: theme.colorScheme.onPrimary,
                          size: 13,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleTimeSLot(index,
      {required timeSLot, required AppointmentProvider appointmentProvider}) {
    return Material(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: () {
          if (timeSLot!.state != 'buzy') {
            appointmentProvider.setSelectedTimeSlot(
                timeSLot!.original, timeSLot!.time);
            Scrollable.ensureVisible(reserveButtonKey.currentContext!);
          } else {
            return null;
          }
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: timeSLot!.state == 'buzy'
                  ? customTheme.shimmerBaseColor
                  :       theme.primaryColorLight ,

                    boxShadow: [
                BoxShadow(color: theme.scaffoldBackgroundColor, spreadRadius: 8),
              ],
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                  color: appointmentProvider.selectedTimeSlot ==
                          (timeSLot!.original)
                      ? theme.primaryColorDark
                      : Colors.transparent,
                  width: 1)),
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          margin: const EdgeInsets.all(0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      //'07:30 PM',
                      timeSLot!.time,
                      style: TextStyle(
                          color: timeSLot!.state != 'buzy'
                              ? appointmentProvider.selectedTimeSlot ==
                                      (timeSLot!.original)
                                  ? theme.primaryColorDark
                                  : theme.colorScheme.onSurface
                              : customTheme.disabledColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
