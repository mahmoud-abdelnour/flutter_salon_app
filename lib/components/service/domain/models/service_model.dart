class ServiceModel {
  int? _id;
  String? _name;
  String? _description;
  String? _serviceImage;
  String? _serviceIcon;

  ServiceModel({
    int? id,
    String? name,
    String? description,
    String? serviceImage,
    String? serviceIcon,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _serviceImage = serviceImage;
    _serviceIcon = serviceIcon;
  }

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get serviceImage => _serviceImage;
  String? get serviceIcon => _serviceIcon;

  ServiceModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _serviceImage = json['service_image'];
    _serviceIcon = json['service_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['description'] = _description;
    data['serviceImage'] = _serviceImage;
    data['serviceIcon'] = _serviceIcon;

    return data;
  }

    @override
  String toString() {
    return 'ServiceModel('
        'id: $id, '
        'name: $name, '
        'description: $description, '
        'serviceImage: $serviceImage'
        'serviceIcon: $serviceIcon'
        ')';
  }
  
}
