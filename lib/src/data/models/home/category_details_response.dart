class ProductDetails {
  bool? active;
  bool? isDivisible;
  bool? hasModifier;
  String? order;
  int? inPrice;
  int? outPrice;
  String? currency;
  String? count;
  String? id;
  String? slug;
  String? image;
  String? code;
  List<Null>? gallery;
  String? iikoId;
  String? jowiId;
  Description? description;
  Description? title;
  Brand? brand;
  Rate? rate;
  bool? activeInMenu;
  String? fromTime;
  String? toTime;
  bool? offAlways;
  Null favorites;
  List<Categories>? categories;
  List<Null>? tags;
  List<Null>? productProperty;
  List<Null>? properties;
  List<Null>? variantProducts;
  String? type;
  bool? addToOrder;
  int? defaultQuantity;

  ProductDetails({this.active,
    this.isDivisible,
    this.hasModifier,
    this.order,
    this.inPrice,
    this.outPrice,
    this.currency,
    this.count,
    this.id,
    this.slug,
    this.image,
    this.code,
    this.gallery,
    this.iikoId,
    this.jowiId,
    this.description,
    this.title,
    this.brand,
    this.rate,
    this.activeInMenu,
    this.fromTime,
    this.toTime,
    this.offAlways,
    this.favorites,
    this.categories,
    this.tags,
    this.productProperty,
    this.properties,
    this.variantProducts,
    this.type,
    this.addToOrder,
    this.defaultQuantity});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    isDivisible = json['is_divisible'];
    hasModifier = json['has_modifier'];
    order = json['order'];
    inPrice = json['in_price'];
    outPrice = json['out_price'];
    currency = json['currency'];
    count = json['count'];
    id = json['id'];
    slug = json['slug'];
    image = json['image'];
    code = json['code'];
    if (json['gallery'] != null) {
      gallery = <Null>[];
      json['gallery'].forEach((v) {});
    }
    iikoId = json['iiko_id'];
    jowiId = json['jowi_id'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    rate = json['rate'] != null ? Rate.fromJson(json['rate']) : null;
    activeInMenu = json['active_in_menu'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    offAlways = json['off_always'];
    favorites = json['favorites'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {});
    }
    if (json['product_property'] != null) {
      productProperty = <Null>[];
      json['product_property'].forEach((v) {});
    }
    if (json['properties'] != null) {
      properties = <Null>[];
      json['properties'].forEach((v) {});
    }
    if (json['variant_products'] != null) {
      variantProducts = <Null>[];
      json['variant_products'].forEach((v) {});
    }
    type = json['type'];
    addToOrder = json['add_to_order'];
    defaultQuantity = json['default_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['active'] = active;
    data['is_divisible'] = isDivisible;
    data['has_modifier'] = hasModifier;
    data['order'] = order;
    data['in_price'] = inPrice;
    data['out_price'] = outPrice;
    data['currency'] = currency;
    data['count'] = count;
    data['id'] = id;
    data['slug'] = slug;
    data['image'] = image;
    data['code'] = code;
    if (gallery != null) {}
    data['iiko_id'] = iikoId;
    data['jowi_id'] = jowiId;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (rate != null) {
      data['rate'] = rate!.toJson();
    }
    data['active_in_menu'] = activeInMenu;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['off_always'] = offAlways;
    data['favorites'] = favorites;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {}
    if (productProperty != null) {}
    if (properties != null) {}
    if (variantProducts != null) {}
    data['type'] = type;
    data['add_to_order'] = addToOrder;
    data['default_quantity'] = defaultQuantity;
    return data;
  }
}

class Description {
  String? uz;
  String? ru;
  String? en;

  Description({this.uz, this.ru, this.en});

  Description.fromJson(Map<String, dynamic> json) {
    uz = json['uz'];
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uz'] = uz;
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}

class Brand {
  String? id;
  String? slug;
  String? parentId;
  String? image;
  Description? description;
  Description? title;
  String? orderNo;
  bool? isActive;

  Brand({this.id,
    this.slug,
    this.parentId,
    this.image,
    this.description,
    this.title,
    this.orderNo,
    this.isActive});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    parentId = json['parent_id'];
    image = json['image'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    orderNo = json['order_no'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    data['image'] = image;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['order_no'] = orderNo;
    data['is_active'] = isActive;
    return data;
  }
}

class Rate {
  String? id;
  String? slug;
  String? code;
  String? rateAmount;
  String? title;

  Rate({this.id, this.slug, this.code, this.rateAmount, this.title});

  Rate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    code = json['code'];
    rateAmount = json['rate_amount'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['code'] = code;
    data['rate_amount'] = rateAmount;
    data['title'] = title;
    return data;
  }
}

class Categories {
  String? id;
  String? slug;
  String? parentId;
  String? image;
  Description? description;
  Description? title;
  String? orderNo;
  bool? active;
  Null products;
  Null childCategories;

  Categories({this.id,
    this.slug,
    this.parentId,
    this.image,
    this.description,
    this.title,
    this.orderNo,
    this.active,
    this.products,
    this.childCategories});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    parentId = json['parent_id'];
    image = json['image'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    orderNo = json['order_no'];
    active = json['active'];
    products = json['products'];
    childCategories = json['child_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    data['image'] = image;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['order_no'] = orderNo;
    data['active'] = active;
    data['products'] = products;
    data['child_categories'] = childCategories;
    return data;
  }
}