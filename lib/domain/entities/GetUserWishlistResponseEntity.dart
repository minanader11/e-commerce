import 'package:e_commerce/domain/entities/productResponseEntity.dart';

class GetUserWishlistResponseEntity {
  GetUserWishlistResponseEntity({
      this.status, 
      this.count, 
      this.data,});


  String? status;
  num? count;
  List<ProductEntity>? data;



}







