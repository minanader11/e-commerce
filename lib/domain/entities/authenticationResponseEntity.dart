class AuthenticationResponseEntity {
  AuthenticationResponseEntity({
      this.message, 
      this.user, 
      this.token,});


  String? message;
  UserResponseEntity? user;
  String? token;



}

class UserResponseEntity {
  UserResponseEntity({
      this.name, 
      this.email, 
      this.role,});


  String? name;
  String? email;
  String? role;



}