// To parse this JSON data, do
//
//     final members = membersFromJson(jsonString);

import 'dart:convert';

List<Members> membersFromJson(String str) =>
    List<Members>.from(json.decode(str).map((x) => Members.fromJson(x)));

String membersToJson(List<Members> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Members {
  Members({
    required this.id,
    required this.fullname,
    required this.stdno,
    required this.email,
    required this.branch,
    required this.section,
    required this.graduation,
    required this.domain,
    required this.coordinator,
    required this.github,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.linkedin,
    required this.imageUrl,
    required this.website,
  });

  String id;
  String fullname;
  String stdno;
  String email;
  String branch;
  int section;
  int graduation;
  String domain;
  bool coordinator;
  String github;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String linkedin;
  String imageUrl;
  String website;

  factory Members.fromJson(Map<String, dynamic> json) => Members(
        id: json["_id"],
        fullname: json["fullname"],
        stdno: json["stdno"],
        email: json["email"],
        branch: json["branch"],
        section: json["section"],
        graduation: json["graduation"],
        domain: json["domain"],
        coordinator: json["coordinator"],
        github: json["github"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        linkedin: json["linkedin"] == null ? 'null' : json["linkedin"],
        imageUrl: json["imageUrl"] == null ? 'null' : json["imageUrl"],
        website: json["website"] == null ? 'null' : json["website"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "stdno": stdno,
        "email": email,
        "branch": branch,
        "section": section,
        "graduation": graduation,
        "domain": domain,
        "coordinator": coordinator,
        "github": github,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "linkedin": linkedin == null ? 'null' : linkedin,
        "imageUrl": imageUrl == null ? 'null' : imageUrl,
        "website": website == null ? 'null' : website,
      };
}
