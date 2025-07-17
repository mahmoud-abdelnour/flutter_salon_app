class BannerModel {
  String? _id;
  String? _title;
  String? _image;

  BannerModel({
    String? id,
    String? title,
    String? image,
  }) {
    _id = id;
    _title = title;
    _image = image;
  }

  String? get id => _id;
  String? get title => _title;
  String? get image => _image;

  BannerModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['image'] = _image;

    return data;
  }
}
