import 'dart:convert';

class RoomRentalModel {
  String? status;
  int? statusCode;
  String? message;
  List<Datum>? data;

  RoomRentalModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory RoomRentalModel.fromRawJson(String str) => RoomRentalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomRentalModel.fromJson(Map<String, dynamic> json) => RoomRentalModel(
    status: json["status"],
    statusCode: json["status_code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_code": statusCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? title;
  String? description;
  int? price;
  Location? location;
  Landlord? landlord;
  List<String>? images;
  Features? features;
  Availability? availability;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.title,
    this.description,
    this.price,
    this.location,
    this.landlord,
    this.images,
    this.features,
    this.availability,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    landlord: json["landlord"] == null ? null : Landlord.fromJson(json["landlord"]),
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    features: json["features"] == null ? null : Features.fromJson(json["features"]),
    availability: json["availability"] == null ? null : Availability.fromJson(json["availability"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "location": location?.toJson(),
    "landlord": landlord?.toJson(),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "features": features?.toJson(),
    "availability": availability?.toJson(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Availability {
  String? status;
  DateTime? moveInDate;

  Availability({
    this.status,
    this.moveInDate,
  });

  factory Availability.fromRawJson(String str) => Availability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    status: json["status"]!,
    moveInDate: json["move_in_date"] == null ? null : DateTime.parse(json["move_in_date"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "move_in_date": "${moveInDate!.year.toString().padLeft(4, '0')}-${moveInDate!.month.toString().padLeft(2, '0')}-${moveInDate!.day.toString().padLeft(2, '0')}",
  };
}





class Features {
  int? bedrooms;
  int? bathrooms;
  bool? furnished;
  bool? parking;
  bool? wifi;

  Features({
    this.bedrooms,
    this.bathrooms,
    this.furnished,
    this.parking,
    this.wifi,
  });

  factory Features.fromRawJson(String str) => Features.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Features.fromJson(Map<String, dynamic> json) => Features(
    bedrooms: json["bedrooms"],
    bathrooms: json["bathrooms"],
    furnished: json["furnished"],
    parking: json["parking"],
    wifi: json["wifi"],
  );

  Map<String, dynamic> toJson() => {
    "bedrooms": bedrooms,
    "bathrooms": bathrooms,
    "furnished": furnished,
    "parking": parking,
    "wifi": wifi,
  };
}

class Landlord {
  int? id;
  String? name;
  String? contact;
  String? email;

  Landlord({
    this.id,
    this.name,
    this.contact,
    this.email,
  });

  factory Landlord.fromRawJson(String str) => Landlord.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Landlord.fromJson(Map<String, dynamic> json) => Landlord(
    id: json["id"],
    name: json["name"],
    contact: json["contact"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "contact": contact,
    "email": email,
  };
}

class Location {
  String? address;
  String? city;
  String? state;
  String? zipCode;

  Location({
    this.address,
    this.city,
    this.state,
    this.zipCode,
  });

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address: json["address"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "city": city,
    "state": state,
    "zip_code": zipCode,
  };
}


