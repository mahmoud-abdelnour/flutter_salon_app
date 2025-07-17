class SignUpModel {
  String? userName;
  String? lName;
  String? phone;
  String? password;

  SignUpModel({this.userName, this.lName, this.phone, this.password});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
