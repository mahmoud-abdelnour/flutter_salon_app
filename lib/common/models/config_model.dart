class ConfigModel {
  String? _ecommerceName;
  String? _ecommerceLogo;
  String? _ecommerceAddress;
  String? _ecommercePhone;
  String? _ecommerceEmail;
  double? _minimumOrderValue;
  int? _selfPickup;
  BaseUrls? _baseUrls;

  ConfigModel({
    String? ecommerceName,
    String? ecommerceLogo,
    String? ecommerceAddress,
    String? ecommercePhone,
    String? ecommerceEmail,
    double? minimumOrderValue,
    BaseUrls? baseUrls,
  }) {
    _ecommerceName = ecommerceName;
    _ecommerceLogo = ecommerceLogo;
    _ecommerceAddress = ecommerceAddress;
    _ecommercePhone = ecommercePhone;
    _ecommerceEmail = ecommerceEmail;
    _minimumOrderValue = minimumOrderValue;
    _baseUrls = baseUrls;
  }

  String? get ecommerceName => _ecommerceName;
  String? get ecommerceLogo => _ecommerceLogo;
  String? get ecommerceAddress => _ecommerceAddress;
  String? get ecommercePhone => _ecommercePhone;
  String? get ecommerceEmail => _ecommerceEmail;
  double? get minimumOrderValue => _minimumOrderValue;
  BaseUrls? get baseUrls => _baseUrls;

  ConfigModel.fromJson(Map<String, dynamic> json) {

    _ecommerceName = json['ecommerce_name'];
    _ecommerceLogo = json['ecommerce_logo'];
    _ecommerceAddress = json['ecommerce_address'];
    _ecommercePhone = json['ecommerce_phone'];
    _ecommerceEmail = json['ecommerce_email'];
    _minimumOrderValue = json['minimum_order_value'].toDouble();
   /*  _baseUrls = json['base_urls'] != null
        ? BaseUrls.fromJson(json['base_urls'])
        : null; */
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ecommerce_name'] = _ecommerceName;
    data['ecommerce_logo'] = _ecommerceLogo;
    data['ecommerce_address'] = _ecommerceAddress;
    data['ecommerce_phone'] = _ecommercePhone;
    data['ecommerce_email'] = _ecommerceEmail;
    data['minimum_order_value'] = _minimumOrderValue;
    data['self_pickup'] = _selfPickup;
    if (_baseUrls != null) {
      data['base_urls'] = _baseUrls!.toJson();
    }

    return data;
  }
}

class BaseUrls {
  String? productImageUrl;
  String? customerImageUrl;
  String? bannerImageUrl;
  String? categoryImageUrl;
  String? reviewImageUrl;
  String? notificationImageUrl;
  String? ecommerceImageUrl;
  String? deliveryManImageUrl;
  String? chatImageUrl;
  String? categoryBanner;
  String? flashSaleImageUrl;
  String? getWayImageUrl;
  String? orderImageUrl;

  BaseUrls({
    this.productImageUrl,
    this.customerImageUrl,
    this.bannerImageUrl,
    this.categoryImageUrl,
    this.reviewImageUrl,
    this.notificationImageUrl,
    this.ecommerceImageUrl,
    this.deliveryManImageUrl,
    this.chatImageUrl,
    this.categoryBanner,
    this.flashSaleImageUrl,
    this.getWayImageUrl,
    this.orderImageUrl,
  });

  factory BaseUrls.fromJson(Map<String, dynamic> json) {
    return BaseUrls(
      productImageUrl: json['product_image_url'],
      customerImageUrl: json['customer_image_url'],
      bannerImageUrl: json['banner_image_url'],
      categoryImageUrl: json['category_image_url'],
      reviewImageUrl: json['review_image_url'],
      notificationImageUrl: json['notification_image_url'],
      ecommerceImageUrl: json['ecommerce_image_url'],
      deliveryManImageUrl: json['delivery_man_image_url'],
      chatImageUrl: json['chat_image_url'],
      categoryBanner: json['category_banner_image_url'],
      flashSaleImageUrl: json['flash_sale_image_url'],
      getWayImageUrl: json['gateway_image_url'],
      orderImageUrl: json['order_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_image_url': productImageUrl,
      'customer_image_url': customerImageUrl,
      'banner_image_url': bannerImageUrl,
      'category_image_url': categoryImageUrl,
      'review_image_url': reviewImageUrl,
      'notification_image_url': notificationImageUrl,
      'ecommerce_image_url': ecommerceImageUrl,
      'delivery_man_image_url': deliveryManImageUrl,
      'chat_image_url': chatImageUrl,
      'category_banner_image_url': categoryBanner,
      'flash_sale_image_url': flashSaleImageUrl,
      'gateway_image_url': getWayImageUrl,
      'order_image_url': orderImageUrl,
    };
  }
}
