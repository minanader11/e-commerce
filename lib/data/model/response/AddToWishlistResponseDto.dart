import 'package:e_commerce/domain/entities/AddToWishlistResponseEntity.dart';

class AddToWishlistResponseDto extends AddToWishlistResponseEntity{
  AddToWishlistResponseDto({
      super.status,
      super.message,
      super.data,this.statusMsg});

  AddToWishlistResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
    statusMsg=json['statusMsg'];
  }
  String? statusMsg;



}