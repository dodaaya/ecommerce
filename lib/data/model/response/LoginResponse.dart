import 'package:ecommerce/data/model/response/UserDto.dart';
import 'package:ecommerce/domain/entities/auth%20result%20entity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"dtarek153@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NTEwNDdjN2UwNzBhN2QzY2EwZWJmMiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAwMDgwNjk2LCJleHAiOjE3MDc4NTY2OTZ9.8QCTPxl5g9LIrm-5aBt0ybueiBNCk9W82kaTDhBZ5YM"

class LoginResponse {
  LoginResponse({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  String? message;
  UserDto? user;
  String? token;

  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;

    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(userEntity: user?.toUserEntity(), token: token);
  }
}
