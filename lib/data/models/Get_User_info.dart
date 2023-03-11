import 'dart:convert' show json;

ActiveUserInfo userInfoModelFromJson(String str) => ActiveUserInfo.fromJson(json.decode(str));
String userInfoModelToJson(ActiveUserInfo data) => json.encode(data.toJson());

class ActiveUserInfo {
  ActiveUserInfo({
    required this.createdAt,
    required this.fullName,
    required this.gender,
    required this.id,
    required this.phoneNumber,
    required this.updatedAt,
  });

  String createdAt;
  String fullName;
  String gender;
  String id;
  String phoneNumber;
  String updatedAt;

  factory ActiveUserInfo.fromJson(Map<String, dynamic> json) => ActiveUserInfo(
        createdAt: json["created_at"],
        fullName: json["full_name"],
        gender: json["gender"],
        id: json["id"],
        phoneNumber: json["phone_number"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "full_name": fullName,
        "gender": gender,
        "id": id,
        "phone_number": phoneNumber,
        "updated_at": updatedAt,
      };
}
