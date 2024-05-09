import 'package:e_commerce/domain/entities/authenticationResponseEntity.dart';

class AuthenticationResponseDto extends AuthenticationResponseEntity{
  AuthenticationResponseDto({
      super.message,
      super.user,
      super.token,

  this.statusMsg});

  AuthenticationResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserResponseDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg=json['statusMsg'];
  }
String? statusMsg;




}

class UserResponseDto extends UserResponseEntity{
  UserResponseDto({
      super.name,
      super.email,
      super.role,});

  UserResponseDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }




}