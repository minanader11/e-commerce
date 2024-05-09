import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';

class AddToCartResponseDto extends AddToCartResponseEntity{
  AddToCartResponseDto({
      super.status,
      super.message,
      super.numOfCartItems,
      super.data,
  this.statusMsg});

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? AddToCartResponseDataDto.fromJson(json['data']) : null;
    statusMsg=json['statusMsg'];
  }

String? statusMsg;


}

class AddToCartResponseDataDto extends AddToCartResponseDataEntity{
  AddToCartResponseDataDto({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  AddToCartResponseDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddToCartResponseProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


}

class AddToCartResponseProductsDto extends AddToCartResponseProductsEntity {
  AddToCartResponseProductsDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  AddToCartResponseProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }


}