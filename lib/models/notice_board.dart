import 'dart:convert';

class NoticeBordResponse {
  NoticeBordResponse({
    required this.sophiaNotice,
    required this.success,
    required this.message,
  });

  List<SophiaNotice> sophiaNotice;
  int success;
  String message;

  factory NoticeBordResponse.fromJson(String str) =>
      NoticeBordResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NoticeBordResponse.fromMap(Map<String, dynamic> json) =>
      NoticeBordResponse(
        sophiaNotice: List<SophiaNotice>.from(
            json["sophia_notice"].map((x) => SophiaNotice.fromMap(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "sophia_notice": List<dynamic>.from(sophiaNotice.map((x) => x.toMap())),
        "success": success,
        "message": message,
      };
}

class SophiaNotice {
  SophiaNotice({
    required this.id,
    required this.msg,
    required this.weblink,
    required this.updatedAt,
  });

  String id;
  String msg;
  String weblink;
  DateTime updatedAt;

  factory SophiaNotice.fromJson(String str) =>
      SophiaNotice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SophiaNotice.fromMap(Map<String, dynamic> json) => SophiaNotice(
        id: json["id"],
        msg: json["msg"],
        weblink: json["weblink"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "msg": msg,
        "weblink": weblink,
        "updated_at": updatedAt.toIso8601String(),
      };
}
