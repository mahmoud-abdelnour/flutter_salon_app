class GalleryModel {
  String? _id;
  String? _title;
  String? _gallaryImage;

  GalleryModel({
    String? id,
    String? title,
    String? gallaryImage,
  }) {
    _id = id;
    _title = title;
    _gallaryImage = gallaryImage;
  }

  String? get id => _id;
  String? get title => _title;
  String? get gallaryImage => _gallaryImage;

  GalleryModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _gallaryImage = json['gallary_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['gallary_image'] = _gallaryImage;

    return data;
  }
}
