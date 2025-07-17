import 'package:certain_salon/common/models/api_response_model.dart';
import 'package:certain_salon/components/appointment/domain/models/appointment_model.dart';
import 'package:certain_salon/components/appointment/domain/models/employee_model.dart';
import 'package:certain_salon/components/appointment/domain/models/guest_appointment_model.dart';
import 'package:certain_salon/components/appointment/domain/models/service_model.dart';
import 'package:certain_salon/components/appointment/domain/models/time_slot_model.dart';
import 'package:certain_salon/components/appointment/domain/models/user_appointment_model.dart';
import 'package:certain_salon/components/appointment/domain/reposotories/appointment_repo.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/components/home/components/profile.dart';
import 'package:certain_salon/components/home/domain/models/banner_model.dart';
import 'package:certain_salon/helper/api_checker_helper.dart';
import 'package:certain_salon/helper/custom_snackbar_helper.dart';
import 'package:certain_salon/helper/localization_helper.dart';
import 'package:certain_salon/main.dart';
import 'package:certain_salon/routes/app_routes.dart';
import 'package:certain_salon/routes/route_names.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentProvider extends ChangeNotifier {
  final AppointmentRepo? appointmentRepo;
  final SharedPreferences? sharedPreferences;

  AppointmentProvider({required this.appointmentRepo, this.sharedPreferences});

  List<ServiceModel>? _servicesList;
  List<ServiceModel>? get servicesList => _servicesList;

  List<EmployeeModel>? _employeesList = [];
  List<EmployeeModel>? get employeesList => _employeesList;

  List<TimeSlotModel>? _timeSlotsList = [];
  List<TimeSlotModel>? get timeSlotsList => _timeSlotsList;

  dynamic _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  dynamic get selectedDate => _selectedDate;

  int? _selectedEmp;
  int? get selectedEmp => _selectedEmp;

  int? _selectedService;
  int? get selectedService => _selectedService;

  String? _selectedTimeSlot;
  String? get selectedTimeSlot => _selectedTimeSlot;

  String? _selectedTimeSlotFormatted;
  String? get selectedTimeSlotFormatted => _selectedTimeSlotFormatted;

  String? _selectedServiceName;
  String? get selectedServiceName => _selectedServiceName;

  String? _selectedEmpName;
  String? get selectedEmpName => _selectedEmpName;

  GuestAppointmentModel? _guestAppointmentModel;
  GuestAppointmentModel? get guestAppointmentModel => _guestAppointmentModel;

  List<UserAppointmentModel>? _userAppointmentList = [];
  List<UserAppointmentModel>? get userAppointmentList => _userAppointmentList;

  Future<void> getEmployeesList(
      BuildContext? context, selectedServiceId) async {
    if (employeesList == null) {
      ApiResponseModel apiResponse =
          await appointmentRepo!.getEmployeesList(selectedServiceId);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _employeesList = [];
        apiResponse.response!.data.forEach((employee) {
          EmployeeModel employeeModel = EmployeeModel.fromJson(employee);
          _employeesList?.add(employeeModel);
        });
      } else {
        ApiCheckerHelper.checkApi(apiResponse);
      }
      notifyListeners();
    }
  }

  Future<void> getServicesList(BuildContext context) async {
    if (servicesList == null) {
      ApiResponseModel apiResponse = await appointmentRepo!.getServicesList();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _servicesList = [];
        apiResponse.response!.data.forEach((service) {
          ServiceModel serviceModel = ServiceModel.fromJson(service);
          _servicesList?.add(serviceModel);
        });
      } else {
        ApiCheckerHelper.checkApi(apiResponse);
      }
      notifyListeners();
    }
  }

  Future<void> getTimeSlotsList(BuildContext? context, empId) async {
    if (timeSlotsList == null) {
      Map<String, dynamic> parameters = <String, dynamic>{};
      parameters['selectedDate'] = _selectedDate;
      parameters['selected_service'] = _selectedService;
      parameters['selected_emp'] = _selectedEmp;

      ApiResponseModel apiResponse =
          await appointmentRepo!.getTimeSlotsList(parameters);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _timeSlotsList = [];
        Map map = apiResponse.response!.data;
        Map slots = map['data'];
        slots['slots'].forEach((service) {
          TimeSlotModel timeSlotModel = TimeSlotModel.fromJson(service);
          _timeSlotsList?.add(timeSlotModel);
        });
      } else {
        ApiCheckerHelper.checkApi(apiResponse);
      }
      notifyListeners();
    }
  }

  void setSelectedDate(selectedDate) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

    _selectedDate = formattedDate;

    _selectedService = null;
    _selectedEmp = null;
    _timeSlotsList = [];
    _employeesList = [];

    /*   sharedPreferences?.setString(
        AppConstants.stroredSelectedDate, _selectedDate); */

    notifyListeners();
  }

  void setSelectedService(serviceId, [String? name]) {
    _selectedService = serviceId;
    _selectedEmp = null;
    _employeesList = null;
    _timeSlotsList = [];
    _selectedServiceName = name;
    /*   sharedPreferences?.setString(AppConstants.stroredSelectedService, name!);
    sharedPreferences?.setInt(
        AppConstants.stroredSelectedServiceId, serviceId!); */

    getEmployeesList(Get.context, _selectedService);
    notifyListeners();
  }

  void setSelectedEmp(empId, [String? name]) {
    _selectedEmp = empId;
    _selectedTimeSlot = null;
    _timeSlotsList = null;
    _selectedEmpName = name;

    /*  sharedPreferences?.setString(AppConstants.stroredSelectedEmployee, name!);
    sharedPreferences?.setInt(AppConstants.stroredSelectedEmployeeId, empId!); */

    getTimeSlotsList(Get.context, _selectedEmp);
    notifyListeners();
  }

  void setSelectedTimeSlot(timeSlot, [String? timeSlotFormated]) {
    _selectedTimeSlot = timeSlot;
    _selectedTimeSlotFormatted = timeSlotFormated;

    /*  sharedPreferences?.setString(
        AppConstants.stroredSelectedTimeSlot, _selectedTimeSlot!);

    sharedPreferences?.setString(
        AppConstants.stroredSelectedTimeSlotFortmatted, timeSlotFormated!); */

    notifyListeners();
  }

  Future<void> makeAppointment(BuildContext? context) async {
    /* Map<String, dynamic> data = <String, dynamic>{};
    data['selectedDate'] = _selectedDate;
    data['selected_service'] = _selectedService;
    data['selected_emp'] = _selectedEmp;
    data['selectedTimeSlot'] = _selectedTimeSlot; */

    /* 
    _selectedDate = null;
    _selectedService = null;
    _selectedEmp = null;
    _selectedTimeSlot = null;
    _employeesList = [];
    _timeSlotsList = [];
    notifyListeners();
    while (GoRouter.of(context!).canPop()) {
      GoRouter.of(context!).pop();
    }
    context.pushReplacement(RouteNames.successAppointmentStatfulShell.toPath);
    */

    if (_selectedDate == null) {
      showCustomSnackBarHelper(getTranslated('please_select_date', context!));
    } else if (_selectedService == null) {
      showCustomSnackBarHelper(
          getTranslated('please_select_service', context!));
    } else if (_selectedEmp == null) {
      showCustomSnackBarHelper(
          getTranslated('please_select_employee', context!));
    } else if (_selectedTimeSlot!.isEmpty) {
      showCustomSnackBarHelper(
          getTranslated('please_select_timeslot', context!));
    } else {
      final AuthProvider authProvider =
          Provider.of<AuthProvider>(context!, listen: false);
      if (!authProvider.isLoggedIn()) {
        sharedPreferences?.setString(
            AppConstants.stroredSelectedDate, _selectedDate);
        sharedPreferences?.setString(
            AppConstants.stroredSelectedTimeSlot, _selectedTimeSlot!);
        sharedPreferences?.setString(
            AppConstants.stroredSelectedTimeSlotFortmatted,
            _selectedTimeSlotFormatted!);
        sharedPreferences?.setString(
            AppConstants.stroredSelectedEmployee, _selectedEmpName!);
        sharedPreferences?.setInt(
            AppConstants.stroredSelectedEmployeeId, _selectedEmp!);
        sharedPreferences?.setString(
            AppConstants.stroredSelectedService, _selectedServiceName!);
        sharedPreferences?.setInt(
            AppConstants.stroredSelectedServiceId, _selectedService!);

        print('no i am not logged in');
        context.go('/a/login');
      } else {
        print('yes i am logged in');

        AppointmentModel appointmentModel = AppointmentModel(
          appointmentDate: _selectedDate,
          employeeId: _selectedEmp,
          serviceId: _selectedService,
          appointmentTime: _selectedTimeSlot,
        );

        /*   var stroredSelectedDate =
            sharedPreferences?.getString(AppConstants.stroredSelectedDate);
        var stroredSelectedServiceId =
            sharedPreferences?.getInt(AppConstants.stroredSelectedServiceId);
        var stroredSelectedEmployeeId =
            sharedPreferences?.getInt(AppConstants.stroredSelectedEmployeeId);
        var stroredSelectedTimeSlot =
            sharedPreferences?.getString(AppConstants.stroredSelectedTimeSlot);

        print(stroredSelectedDate);
        print(stroredSelectedServiceId);
        print(stroredSelectedEmployeeId);
        print(stroredSelectedTimeSlot); */

        //print(appointmentModel.toJson());

        ApiResponseModel apiResponse =
            await appointmentRepo!.makeAppointment(appointmentModel.toJson());

        /* print("qqqqqq ${apiResponse.response}");
        Map map = apiResponse.response!.data;
        var msgssss = map['msg']; */

        if (apiResponse.response != null &&
            apiResponse.response!.statusCode == 200) {
          _selectedDate = null;
          _selectedService = null;
          _selectedEmp = null;
          _selectedTimeSlot = null;
          _employeesList = [];
          _timeSlotsList = [];

          while (GoRouter.of(context!).canPop()) {
            GoRouter.of(context!).pop();
          }
          context.pushReplacement(RouteNames.successAppointmentStatfulShell.toPath);
        } else {
          ApiCheckerHelper.checkApi(apiResponse);
        }
      }
    }
    notifyListeners();
  }

  void loadGuestAppointment() async {
    var stroredSelectedDate =
        sharedPreferences!.getString(AppConstants.stroredSelectedDate);
    var stroredSelectedService =
        sharedPreferences!.getString(AppConstants.stroredSelectedService);
    var stroredSelectedEmployee =
        sharedPreferences!.getString(AppConstants.stroredSelectedEmployee);
    var stroredSelectedTimeSlot =
        sharedPreferences!.getString(AppConstants.stroredSelectedTimeSlot);

    var stroredSelectedServiceId =
        sharedPreferences!.getInt(AppConstants.stroredSelectedServiceId);
    var stroredSelectedEmployeeId =
        sharedPreferences!.getInt(AppConstants.stroredSelectedEmployeeId);
    var stroredSelectedTimeSlotFortmatted = sharedPreferences!
        .getString(AppConstants.stroredSelectedTimeSlotFortmatted);

    print('aaaappoinmtentProvider.guestAppointmentModelaaaaaaaa');
    print(stroredSelectedDate);
    print(stroredSelectedService);
    print(stroredSelectedEmployee);
    print(stroredSelectedTimeSlot);
    print(stroredSelectedServiceId);
    print(stroredSelectedEmployeeId);
    print(stroredSelectedTimeSlotFortmatted);

    GuestAppointmentModel guestAppointmentModel = GuestAppointmentModel(
      appointmentDate: stroredSelectedDate,
      employeeId: stroredSelectedEmployeeId,
      serviceId: stroredSelectedServiceId,
      appointmentTime: stroredSelectedTimeSlot,
      employeeName: stroredSelectedEmployee,
      serviceName: stroredSelectedService,
      timeSlotFormatted: stroredSelectedTimeSlotFortmatted,
    );

    _guestAppointmentModel = guestAppointmentModel;

    notifyListeners();
  }

  Future<void> getUserAppointments(BuildContext? context) async {
    ApiResponseModel apiResponse = await appointmentRepo!.getUserAppointments();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {

      _userAppointmentList = [];
      apiResponse.response!.data.forEach((appointment) {
        UserAppointmentModel userAppointmentModel =
            UserAppointmentModel.fromJson(appointment);
        _userAppointmentList?.add(userAppointmentModel);
      });


    } else {
      ApiCheckerHelper.checkApi(apiResponse);
    }
    notifyListeners();
  }

  Future<void> cancelAppointment(BuildContext? context,appointmentId) async {
    Map<String, dynamic> data = <String, dynamic>{};
    data['appointmentId'] = appointmentId;

    ApiResponseModel apiResponse =
        await appointmentRepo!.cancelAppointment(data);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      print('holaaaaaaaa');
        getUserAppointments(context);
    } else {
      print('eeeeee');
      ApiCheckerHelper.checkApi(apiResponse);
    }
    notifyListeners();
  }
}
