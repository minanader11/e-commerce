import 'package:e_commerce/domain/entities/productResponseEntity.dart';

class AddOrGetToCartResponseEntity {
  AddOrGetToCartResponseEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});


  String? status;
  String? message;
  num? numOfCartItems;
  AddOrGetToCartResponseDataEntity? data;


}

class AddOrGetToCartResponseDataEntity {
  AddOrGetToCartResponseDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;
  List<AddOrGetToCartResponseProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;



}

class AddOrGetToCartResponseProductsEntity {
  AddOrGetToCartResponseProductsEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});


  num? count;
  String? id;
  ProductFromAddToCartResponseEntity? product;
  num? price;



}
class ProductFromAddToCartResponseEntity {
  ProductFromAddToCartResponseEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    });


  List<SubcategoryResponseEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryResponseEntity? category;
  BrandResponseEntity? brand;
  num? ratingsAverage;




}