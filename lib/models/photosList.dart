import 'dart:convert';

class PhotosListResponse {
  PhotosListResponse({
    required this.photosList,
    required this.success,
    required this.message,
  });

  List<PhotosList> photosList;
  int success;
  String message;

  factory PhotosListResponse.fromJson(String str) => PhotosListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PhotosListResponse.fromMap(Map<String, dynamic> json) => PhotosListResponse(
    photosList: List<PhotosList>.from(json["galleryimages"].map((x) => PhotosList.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "galleryimages": List<dynamic>.from(photosList.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class PhotosList {
  PhotosList({
    required this.id,
    required this.pId,
    required this.image,
    required this.updatedAt,
  });

  String id;
  String pId;
  String image;
  DateTime updatedAt;

  factory PhotosList.fromJson(String str) => PhotosList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PhotosList.fromMap(Map<String, dynamic> json) => PhotosList(
    id: json["id"],
    pId: json["p_id"],
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "p_id": pId,
    "image": image,
    "updated_at": updatedAt.toIso8601String(),
  };
}
