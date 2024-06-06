import 'package:e_commerce/domain/entities/RemoveProductFromWishlistResponseEntity.dart';

class RemoveProductFromWishlistResponseDto extends RemoveProductFromWishlistResponseEntity{
  RemoveProductFromWishlistResponseDto({
      super.status,
      super.message,
      super.data,});

  RemoveProductFromWishlistResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }



}