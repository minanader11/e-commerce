import 'package:e_commerce/domain/entities/AddOrGetToCartResponseEntity.dart';

class GetUserCartResponseEntity {
  GetUserCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.data,});

  String? status;
  num? numOfCartItems;
  AddOrGetToCartResponseDataEntity? data;



}











