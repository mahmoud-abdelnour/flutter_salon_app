class AppointmentModel {
  String? _id;
  dynamic _appointmentDate;
  String? _appointmentTime;
  int? _serviceId;
  int? _employeeId;

  AppointmentModel({
    String? id,
    dynamic? appointmentDate,
    String? appointmentTime,
    int? serviceId,
    int? employeeId,
  }) {
    _id = id;
    _appointmentDate = appointmentDate;
    _appointmentTime = appointmentTime;
    _serviceId = serviceId;
    _employeeId = employeeId;
  }

  String? get id => _id;
  dynamic? get appointmentDate => _appointmentDate;
  String? get appointmentTime => _appointmentTime;
  int? get serviceId => _serviceId;
  int? get employeeId => _employeeId;

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _appointmentDate = json['appointment_date'];
    _appointmentTime = json['appointment_time'];
    _serviceId = json['service_id'];
    _employeeId = json['employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['appointment_date'] = '${_appointmentDate}';
    data['appointment_time'] = _appointmentTime;
    data['service_id'] = _serviceId;
    data['employee_id'] = _employeeId;
    return data;
  }
}
