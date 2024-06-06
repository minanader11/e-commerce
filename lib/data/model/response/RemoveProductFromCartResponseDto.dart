import 'package:e_commerce/data/model/response/ProductResponseDto.dart';
import 'package:e_commerce/domain/entities/RemoveProductFromCartResponseEntity.dart';

class RemoveProductFromCartResponseDto extends RemoveProductFromCartResponseEntity {
  RemoveProductFromCartResponseDto({
      super.status,
      super.numOfCartItems,
      super.data,
  this.message,
  this.statusMsg});

  RemoveProductFromCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? RemoveProductFromCartResponseDataDto.fromJson(json['data']) : null;
  }

  String? statusMsg;
  String? message;


}

class RemoveProductFromCartResponseDataDto extends RemoveProductFromCartResponseDataEntity {
  RemoveProductFromCartResponseDataDto({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  RemoveProductFromCartResponseDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(RemoveProductFromCartResponseProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }




}

class RemoveProductFromCartResponseProductsDto extends RemoveProductFromCartResponseProductsEntity {
  RemoveProductFromCartResponseProductsDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  RemoveProductFromCartResponseProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? RemoveProductFromCartResponseProductDto.fromJson(json['product']) : null;
    price = json['price'];
  }




}

class RemoveProductFromCartResponseProductDto extends RemoveProductFromCartResponseProductEntity{
  RemoveProductFromCartResponseProductDto({
      super.subcategory,
      super.id,
      super.title,
      super.quantity,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
      });

  RemoveProductFromCartResponseProductDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryResponseDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? CategoryResponseDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? BrandResponseDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }




}

