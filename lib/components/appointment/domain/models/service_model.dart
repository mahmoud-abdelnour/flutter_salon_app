class ServiceModel {
  int? _id;
  String? _name;
  String? _serviceImage;
  String? _serviceIcon;


  ServiceModel({
    int? id,
    String? name,
    String? serviceImage,
    String? serviceIcon,

  }) {
    _id = id;
    _name = name;
    _serviceImage = serviceImage;
    _serviceIcon = serviceIcon;

  }

  int? get id => _id;
  String? get name => _name;
  String? get serviceImage => _serviceImage;
  String? get serviceIcon => _serviceIcon;


  ServiceModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _serviceImage = json['service_image'];
    _serviceIcon = json['service_icon'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['serviceImage'] = _serviceImage;
    data['serviceIcon'] = _serviceIcon;


    return data;
  }
}
