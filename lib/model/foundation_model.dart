// To parse this JSON data, do
//
//     final foundation = foundationFromJson(jsonString);

import 'dart:convert';

import 'package:vexana/vexana.dart';

List<Foundation> foundationFromJson(String str) =>
    List<Foundation>.from(json.decode(str).map((x) => Foundation.fromJson(x)));

String foundationToJson(List<Foundation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Foundation extends INetworkModel {
  Foundation({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  factory Foundation.fromJson(Map<String, dynamic> json) => Foundation(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };

  @override
  fromJson(Map<String, dynamic> json) {
    return Foundation(
      postId: json["postId"],
      id: json["id"],
      name: json["name"],
      email: json["email"],
      body: json["body"],
    );
  }
}
