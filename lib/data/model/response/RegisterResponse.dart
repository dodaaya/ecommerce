import 'package:ecommerce/data/model/response/Error.dart';
import 'package:ecommerce/data/model/response/UserDto.dart';
import 'package:ecommerce/domain/entities/auth%20result%20entity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"dtarek153@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NTEwNDdjN2UwNzBhN2QzY2EwZWJmMiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5ODA4MzgxLCJleHAiOjE3MDc1ODQzODF9.spulJdYy9lRaPssByDerVROAq3o2hJxV7nfO3nRo4Jw"

class RegisterResponse {
  RegisterResponse({
    this.message,
    this.user,
    this.error,
    this.statusMsg,
    this.token,
  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['errors'] != null ? ErrorDiana.fromJson(json['errors']) : null;
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  String? message;
  UserDto? user;
  String? token;
  ErrorDiana? error;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['errors'] = error;
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
