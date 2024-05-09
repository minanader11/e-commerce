import 'package:e_commerce/domain/entities/registerRequestEntity.dart';

class RegisterRequestDto extends RegisterRequestEntity {
  RegisterRequestDto({
      super.name,
      super.email,
      super.password,
      super.rePassword,
      super.phone,});




  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }

}