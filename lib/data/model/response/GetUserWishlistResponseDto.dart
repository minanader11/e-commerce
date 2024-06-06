import 'package:e_commerce/data/model/response/CategoriesOrBrandResponseDto.dart';
import 'package:e_commerce/data/model/response/ProductResponseDto.dart';
import 'package:e_commerce/domain/entities/GetUserWishlistResponseEntity.dart';

class GetUserWishlistResponseDto extends GetUserWishlistResponseEntity {
  GetUserWishlistResponseDto({
      super.status,
      super.count,
      super.data,
    this.message,
    this.statusMsg});

  GetUserWishlistResponseDto.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    message = json['message'];
    statusMsg=json['statusMsg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }
  String? statusMsg;
  String? message;



}

