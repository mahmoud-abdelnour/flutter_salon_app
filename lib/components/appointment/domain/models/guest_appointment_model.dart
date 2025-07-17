class GuestAppointmentModel {
  dynamic _appointmentDate;
  String? _appointmentTime;
  int? _serviceId;
  int? _employeeId;
  String? _employeeName;
  String? _serviceName;
  String? _timeSlotFormatted;



  GuestAppointmentModel({
    dynamic? appointmentDate,
    String? appointmentTime,
    int? serviceId,
    int? employeeId,
    String? employeeName,
    String? serviceName,
    String? timeSlotFormatted,
  }) {
    _appointmentDate = appointmentDate;
    _appointmentTime = appointmentTime;
    _serviceId = serviceId;
    _employeeId = employeeId;

    _employeeName = employeeName;
    _serviceName = serviceName;
    _timeSlotFormatted = timeSlotFormatted;
  }

  dynamic? get appointmentDate => _appointmentDate;
  String? get appointmentTime => _appointmentTime;
  int? get serviceId => _serviceId;
  int? get employeeId => _employeeId;

  String? get employeeName => _employeeName;
  String? get serviceName => _serviceName;
  String? get timeSlotFormatted => _timeSlotFormatted;


  GuestAppointmentModel.fromJson(Map<String, dynamic> json) {
    _appointmentDate = json['appointment_date'];
    _appointmentTime = json['appointment_time'];
    _serviceId = json['service_id'];
    _employeeName = json['employeeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointment_date'] = '${_appointmentDate}';
    data['appointment_time'] = _appointmentTime;
    data['service_id'] = _serviceId;
    data['employee_id'] = _employeeId;

    data['employeeName'] = _employeeName;
    data['_serviceName'] = _serviceName;
    data['time_slot_formatted'] = _timeSlotFormatted;

    return data;
  }
}
