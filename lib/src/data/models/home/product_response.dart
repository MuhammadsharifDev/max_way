class CategoryResponse {
  List<Categories>? categories;
  String? count;

  CategoryResponse({this.categories, this.count});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? slug;
  String? parentId;
  Title? description;
  List<ChildCategories>? childCategories;
  String? image;
  String? orderNo;
  List<Null>? products;
  Title? title;
  Title? descriptionV2;

  Categories(
      {this.id,
      this.name,
      this.slug,
      this.parentId,
      this.description,
      this.childCategories,
      this.image,
      this.orderNo,
      this.products,
      this.title,
      this.descriptionV2});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parentId = json['parent_id'];
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    if (json['child_categories'] != null) {
      childCategories = <ChildCategories>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(ChildCategories.fromJson(v));
      });
    }
    image = json['image'];
    orderNo = json['order_no'];
    if (json['products'] != null) {
      products = <Null>[];
      json['products'].forEach((v) {});
    }
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    descriptionV2 = json['description_v2'] != null
        ? Title.fromJson(json['description_v2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    data['description'] = description;
    if (childCategories != null) {
      data['child_categories'] =
          childCategories!.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    data['order_no'] = orderNo;
    if (products != null) {}
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (descriptionV2 != null) {
      data['description_v2'] = descriptionV2!.toJson();
    }
    return data;
  }
}

class ChildCategories {
  String? id;
  String? name;
  String? slug;
  String? parentId;
  Title? description;
  String? image;
  String? orderNo;
  List<void>? products;
  Title? title;
  Title? descriptionV2;

  ChildCategories(
      {this.id,
      this.name,
      this.slug,
      this.parentId,
      this.description,
      this.image,
      this.orderNo,
      this.products,
      this.title,
      this.descriptionV2});

  ChildCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parentId = json['parent_id'];
    description = json['description'] != null ? Title.fromJson(json['description']) : null;
    image = json['image'];
    orderNo = json['order_no'];
    if (json['products'] != null) {
      products = <Null>[];
      json['products'].forEach((v) {});
    }
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    descriptionV2 = json['description_v2'] != null
        ? Title.fromJson(json['description_v2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['image'] = image;
    data['order_no'] = orderNo;
    if (products != null) {}
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (descriptionV2 != null) {
      data['description_v2'] = descriptionV2!.toJson();
    }
    return data;
  }
}

class Title {
  String? uz;
  String? ru;
  String? en;

  Title({this.uz, this.ru, this.en});

  Title.fromJson(Map<String, dynamic> json) {
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
