class UserAppointmentModel {
  int? _id;
  dynamic _appointmentDate;
  String? _appointmentTime;
  int? _serviceId;
  int? _employeeId;
  int? _validAppointment;
  String? _timeText;

  Service? _service;
  Employee? _employee;

  UserAppointmentModel(
      {int? id,
      dynamic? appointmentDate,
      String? appointmentTime,
      int? serviceId,
      int? employeeId,
      String? timeText,
      Employee? employee,
      int? validAppointment,
      Service? service}) {
    _id = id;
    _appointmentDate = appointmentDate;
    _appointmentTime = appointmentTime;
    _serviceId = serviceId;
    _employeeId = employeeId;
    _timeText = timeText;
    _validAppointment = validAppointment;


    _service = service;
    _employee = employee;
  }

  int? get id => _id;
  dynamic? get appointmentDate => _appointmentDate;
  String? get appointmentTime => _appointmentTime;
  int? get serviceId => _serviceId;
  int? get employeeId => _employeeId;
  int? get validAppointment => _validAppointment;


  Service? get service => _service;
  Employee? get employee => _employee;

  String? get timeText => _timeText;


  UserAppointmentModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _appointmentDate = json['appointment_date'];
    _appointmentTime = json['appointment_time'];
    _serviceId = json['service_id'];
    _employeeId = json['employee_id'];
    _timeText = json['TimeText'];
    _validAppointment = json['valid_appointment'];

    if (json['service'] != null) {
      _service = Service.fromJson(json['service']);
    }

    if (json['employee'] != null) {
      _employee = Employee.fromJson(json['employee']);
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['appointment_date'] = '${_appointmentDate}';
    data['appointment_time'] = _appointmentTime;
    data['service_id'] = _serviceId;
    data['employee_id'] = _employeeId;
    data['TimeText'] = _timeText;
    data['valid_appointment'] = _validAppointment;

    if (_service != null) {
      data['service'] = _service?.toJson();
    }

    if (_employee != null) {
      data['employee'] = _employee?.toJson();
    }

    return data;
  }
}

class Service {
  int? _id;
  String? _name;
  String? _serviceImage;

  Service({int? id, String? name, String? serviceImage}) {
    _id = id;
    _name = name;
    _serviceImage = serviceImage;
  }

  int? get id => _id;
  String? get name => _name;
  String? get serviceImage => _serviceImage;

  Service.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _serviceImage = json['service_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['service_image'] = _serviceImage;
    return data;
  }
}




class Employee {
  int? _id;
  String? _firstName;

  Employee({int? id, String? firstName}) {
    _id = id;
    _firstName = firstName;
  }

  int? get id => _id;
  String? get name => _firstName;

  Employee.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['first_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['first_name'] = _firstName;
    return data;
  }
}
