// To parse this JSON data, do
//
//     final createNewAccountModel = createNewAccountModelFromJson(jsonString);

import 'dart:convert';

CreateNewAccountModel createNewAccountModelFromJson(String str) =>
    CreateNewAccountModel.fromJson(json.decode(str));

String createNewAccountModelToJson(CreateNewAccountModel data) =>
    json.encode(data.toJson());

class CreateNewAccountModel {
  CreateNewAccountModel({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory CreateNewAccountModel.fromJson(Map<String, dynamic> json) =>
      CreateNewAccountModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.usersCustomersId,
    this.onesignalId,
    this.fullName,
    this.userEmail,
    this.userPassword,
    this.userPhone,
    this.packagesId,
    this.systemGendersId,
    this.dateOfBirth,
    this.termsAgreements,
    this.notificationSwitch,
    this.sizesUnitsId,
    this.sizesUkId,
    this.neck,
    this.sleevesLength,
    this.chest,
    this.underBust,
    this.waist,
    this.hip,
    this.height,
    this.belly,
    this.calf,
    this.thigh,
    this.insideLegLength,
    this.verifyOtp,
    this.resetOtp,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  String? usersCustomersId;
  String? onesignalId;
  String? fullName;
  String? userEmail;
  String? userPassword;
  String? userPhone;
  String? packagesId;
  String? systemGendersId;
  DateTime? dateOfBirth;
  String? termsAgreements;
  String? notificationSwitch;
  dynamic sizesUnitsId;
  dynamic sizesUkId;
  dynamic neck;
  dynamic sleevesLength;
  dynamic chest;
  dynamic underBust;
  dynamic waist;
  dynamic hip;
  dynamic height;
  dynamic belly;
  dynamic calf;
  dynamic thigh;
  dynamic insideLegLength;
  String? verifyOtp;
  dynamic resetOtp;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;

  factory User.fromJson(Map<String, dynamic> json) => User(
        usersCustomersId: json["users_customers_id"],
        onesignalId: json["onesignal_id"],
        fullName: json["full_name"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        userPhone: json["user_phone"],
        packagesId: json["packages_id"],
        systemGendersId: json["system_genders_id"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        termsAgreements: json["terms_agreements"],
        notificationSwitch: json["notification_switch"],
        sizesUnitsId: json["sizes_units_id"],
        sizesUkId: json["sizes_uk_id"],
        neck: json["neck"],
        sleevesLength: json["sleeves_length"],
        chest: json["chest"],
        underBust: json["under_bust"],
        waist: json["waist"],
        hip: json["hip"],
        height: json["height"],
        belly: json["belly"],
        calf: json["calf"],
        thigh: json["thigh"],
        insideLegLength: json["inside_leg_length"],
        verifyOtp: json["verify_otp"],
        resetOtp: json["reset_otp"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "users_customers_id": usersCustomersId,
        "onesignal_id": onesignalId,
        "full_name": fullName,
        "user_email": userEmail,
        "user_password": userPassword,
        "user_phone": userPhone,
        "packages_id": packagesId,
        "system_genders_id": systemGendersId,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "terms_agreements": termsAgreements,
        "notification_switch": notificationSwitch,
        "sizes_units_id": sizesUnitsId,
        "sizes_uk_id": sizesUkId,
        "neck": neck,
        "sleeves_length": sleevesLength,
        "chest": chest,
        "under_bust": underBust,
        "waist": waist,
        "hip": hip,
        "height": height,
        "belly": belly,
        "calf": calf,
        "thigh": thigh,
        "inside_leg_length": insideLegLength,
        "verify_otp": verifyOtp,
        "reset_otp": resetOtp,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "status": status,
      };
}
