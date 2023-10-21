class BranchsResponse {
  List<Branch>? branches;
  String? count;

  BranchsResponse({this.branches, this.count});

  BranchsResponse.fromJson(Map<String, dynamic> json) {
    if (json['branches'] != null) {
      branches = <Branch>[];
      json['branches'].forEach((v) {
        branches!.add(Branch.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Branch {
  String? id;
  String? shipperId;
  String? name;
  String? image;
  String? phone;
  bool? isActive;
  String? address;
  Location? location;
  String? createdAt;
  String? updatedAt;
  String? destination;
  String? workHourStart;
  String? workHourEnd;
  String? jowiId;
  String? iikoId;
  String? iikoTerminalId;
  String? fareId;
  String? tgChatId;
  String? geozoneId;
  Geozone? geozone;
  String? ordersLimit;
  int? radiusWithoutDeliveryPrice;
  int? realTimeOrdersAmount;
  dynamic fare;
  String? menuId;
  dynamic menuTitle;
  String? crm;
  String? iikoHallTerminalId;

  Branch({
    this.id,
    this.shipperId,
    this.name,
    this.image,
    this.phone,
    this.isActive,
    this.address,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.destination,
    this.workHourStart,
    this.workHourEnd,
    this.jowiId,
    this.iikoId,
    this.iikoTerminalId,
    this.fareId,
    this.tgChatId,
    this.geozoneId,
    this.geozone,
    this.ordersLimit,
    this.radiusWithoutDeliveryPrice,
    this.realTimeOrdersAmount,
    this.fare,
    this.menuId,
    this.menuTitle,
    this.crm,
    this.iikoHallTerminalId,
  });

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shipperId = json['shipper_id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    isActive = json['is_active'];
    address = json['address'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    destination = json['destination'];
    workHourStart = json['work_hour_start'];
    workHourEnd = json['work_hour_end'];
    jowiId = json['jowi_id'];
    iikoId = json['iiko_id'];
    iikoTerminalId = json['iiko_terminal_id'];
    fareId = json['fare_id'];
    tgChatId = json['tg_chat_id'];
    geozoneId = json['geozone_id'];
    geozone =
        json['geozone'] != null ? Geozone.fromJson(json['geozone']) : null;
    ordersLimit = json['orders_limit'];
    radiusWithoutDeliveryPrice = json['radius_without_delivery_price'];
    realTimeOrdersAmount = json['real_time_orders_amount'];
    fare = json['fare'];
    menuId = json['menu_id'];
    menuTitle = json['menu_title'];
    crm = json['crm'];
    iikoHallTerminalId = json['iiko_hall_terminal_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shipper_id'] = shipperId;
    data['name'] = name;
    data['image'] = image;
    data['phone'] = phone;
    data['is_active'] = isActive;
    data['address'] = address;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['destination'] = destination;
    data['work_hour_start'] = workHourStart;
    data['work_hour_end'] = workHourEnd;
    data['jowi_id'] = jowiId;
    data['iiko_id'] = iikoId;
    data['iiko_terminal_id'] = iikoTerminalId;
    data['fare_id'] = fareId;
    data['tg_chat_id'] = tgChatId;
    data['geozone_id'] = geozoneId;
    if (geozone != null) {
      data['geozone'] = geozone!.toJson();
    }
    data['orders_limit'] = ordersLimit;
    data['radius_without_delivery_price'] = radiusWithoutDeliveryPrice;
    data['real_time_orders_amount'] = realTimeOrdersAmount;
    data['fare'] = fare;
    data['menu_id'] = menuId;
    data['menu_title'] = menuTitle;
    data['crm'] = crm;
    data['iiko_hall_terminal_id'] = iikoHallTerminalId;
    return data;
  }
}

class Location {
  double? long;
  double? lat;

  Location({this.long, this.lat});

  Location.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['long'] = long;
    data['lat'] = lat;
    return data;
  }
}

class Geozone {
  String? id;
  String? shipperId;
  String? name;
  List<Points>? points;
  String? createdAt;
  String? updatedAt;

  Geozone(
      {this.id,
      this.shipperId,
      this.name,
      this.points,
      this.createdAt,
      this.updatedAt});

  Geozone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shipperId = json['shipper_id'];
    name = json['name'];
    if (json['points'] != null) {
      points = <Points>[];
      json['points'].forEach((v) {
        points!.add(Points.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shipper_id'] = shipperId;
    data['name'] = name;
    if (points != null) {
      data['points'] = points!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Points {
  double? lat;
  double? lon;

  Points({this.lat, this.lon});

  Points.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}
