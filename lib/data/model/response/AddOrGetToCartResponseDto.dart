import 'package:e_commerce/data/model/response/ProductResponseDto.dart';
import 'package:e_commerce/domain/entities/AddOrGetToCartResponseEntity.dart';

class AddOrGetToCartResponseDto extends AddOrGetToCartResponseEntity{
  AddOrGetToCartResponseDto({
      super.status,
      super.message,
      super.numOfCartItems,
      super.data,
  this.statusMsg});

  AddOrGetToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? AddOrGetToCartResponseDataDto.fromJson(json['data']) : null;
    statusMsg=json['statusMsg'];
  }

String? statusMsg;


}

class AddOrGetToCartResponseDataDto extends AddOrGetToCartResponseDataEntity{
  AddOrGetToCartResponseDataDto({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  AddOrGetToCartResponseDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddOrGetToCartResponseProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


}

class AddOrGetToCartResponseProductsDto extends AddOrGetToCartResponseProductsEntity {
  AddOrGetToCartResponseProductsDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  AddOrGetToCartResponseProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product']!=null? ProductFromAddToCartResponseDto.fromJson(json['product']):null;
    price = json['price'];
  }


}
class ProductFromAddToCartResponseDto  extends ProductFromAddToCartResponseEntity{
  ProductFromAddToCartResponseDto({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
   });

  ProductFromAddToCartResponseDto.fromJson(dynamic json) {
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