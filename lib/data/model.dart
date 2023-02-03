// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

API1Datanew modelFromJson(String str) => API1Datanew.fromJson(json.decode(str));

String modelToJson(API1Datanew data) => json.encode(data.toJson());

class API1Datanew {
  API1Datanew({
    required this.requestId,
    required this.items,
    required this.count,
    required this.anyKey,
  });

  String requestId;
  List<Item> items;
  int count;
  String anyKey;

  factory API1Datanew.fromJson(Map<String, dynamic> json) => API1Datanew(
        requestId: json["requestId"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        count: json["count"],
        anyKey: json["anyKey"],
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "count": count,
        "anyKey": anyKey,
      };
}

class Item {
  Item({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });

  String? createdAt;
  String? name;
  int? duration;
  String? category;
  bool? locked;
  String? id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        createdAt: json["createdAt"],
        name: json["name"],
        duration: json["duration"],
        category: json["category"],
        locked: json["locked"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "duration": duration,
        "category": category,
        "locked": locked,
        "id": id,
      };
}
