import 'dart:convert' show json;

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));
String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({
    required this.accessToken,
    required this.createdAt,
    required this.fullName,
    required this.gender,
    required this.id,
    required this.isActive,
    required this.phoneNumber,
    required this.refreshToken,
    required this.updatedAt,
  });

  String accessToken;
  String createdAt;
  String fullName;
  String gender;
  String id;
  bool isActive;
  String phoneNumber;
  String refreshToken;
  String updatedAt;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        accessToken: json["access_token"],
        createdAt: json["created_at"],
        fullName: json["full_name"],
        gender: json["gender"],
        id: json["id"],
        isActive: json["is_active"],
        phoneNumber: json["phone_number"],
        refreshToken: json["refresh_token"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "created_at": createdAt,
        "full_name": fullName,
        "gender": gender,
        "id": id,
        "is_active": isActive,
        "phone_number": phoneNumber,
        "refresh_token": refreshToken,
        "updated_at": updatedAt,
      };
}
