import 'dart:convert';

class SophiaAlumniResponse {
  SophiaAlumniResponse({
    required this.sophiaAlumni,
    required this.success,
    required this.message,
  });

  List<SophiaAlumni> sophiaAlumni;
  int success;
  String message;

  factory SophiaAlumniResponse.fromJson(String str) => SophiaAlumniResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SophiaAlumniResponse.fromMap(Map<String, dynamic> json) => SophiaAlumniResponse(
    sophiaAlumni: List<SophiaAlumni>.from(json["sophia_alumni"].map((x) => SophiaAlumni.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "sophia_alumni": List<dynamic>.from(sophiaAlumni.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SophiaAlumni {
  SophiaAlumni({
    required this.id,
    required this.name,
    required this.designation,
    required this.image,
    required this.updatedAt,
  });

  String id;
  String name;
  String designation;
  String image;
  DateTime updatedAt;

  factory SophiaAlumni.fromJson(String str) => SophiaAlumni.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SophiaAlumni.fromMap(Map<String, dynamic> json) => SophiaAlumni(
    id: json["id"],
    name: json["name"],
    designation: json["designation"],
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "designation": designation,
    "image": image,
    "updated_at": updatedAt.toIso8601String(),
  };
}
