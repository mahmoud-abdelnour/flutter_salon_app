class UserInfoModel {
  int? id;
  String? firstName;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? phone;

  UserInfoModel(
      {this.id,
        this.firstName,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.phone,
      });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['email'] = email;
    //data['created_at'] = createdAt;
    //data['updated_at'] = updatedAt;
    data['phone'] = phone;
    return data;
  }

  
}
