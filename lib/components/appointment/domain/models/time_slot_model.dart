
class TimeSlotModel {
  String? _state;
  String? _time;
  String? _original;
  String? _dayTime;

  TimeSlotModel({
    String? state,
    String? time,
    String? original,
    String? dayTime,
  }) {
    _state = state;
    _original = time;
    _original = original;
    _dayTime = dayTime;
  }

  String? get state => _state;
  String? get time => _time;
  String? get original => _original;
  String? get dayTime => _dayTime;

  TimeSlotModel.fromJson(Map<String, dynamic> json) {
    _state = json['state'];
    _time = json['time'];
    _original = json['original'];
    _dayTime = json['day_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _state;
    data['time'] = _time;
    data['original'] = _original;
    data['day_time'] = _dayTime;

    return data;
  }
}
