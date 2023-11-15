import 'User.dart';

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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  String? message;
  User? user;
  String? token;
  Error? error;
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
}
