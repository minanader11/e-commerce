import 'package:e_commerce/domain/entities/productResponseEntity.dart';

class RemoveProductFromCartResponseEntity {
  RemoveProductFromCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.data,});


  String? status;
  num? numOfCartItems;
  RemoveProductFromCartResponseDataEntity? data;



}

class RemoveProductFromCartResponseDataEntity {
  RemoveProductFromCartResponseDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;
  List<RemoveProductFromCartResponseProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;



}

class RemoveProductFromCartResponseProductsEntity {
  RemoveProductFromCartResponseProductsEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});


  num? count;
  String? id;
  RemoveProductFromCartResponseProductEntity? product;
  num? price;



}

class RemoveProductFromCartResponseProductEntity {
  RemoveProductFromCartResponseProductEntity({
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

