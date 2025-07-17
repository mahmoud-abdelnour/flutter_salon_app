class EmployeeModel {
  int? _id;
  String? _firstName;
  String? _profileImage;

  EmployeeModel({
    int? id,
    String? firstName,
    String? profileImage,
  }) {
    _id = id;
    _firstName = firstName;
    _profileImage = profileImage;
  }

  int? get id => _id;
  String? get firstName => _firstName;
  String? get profileImage => _profileImage;

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _profileImage = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['first_name'] = firstName;
    data['profile_image'] = _profileImage;

    return data;
  }
}
