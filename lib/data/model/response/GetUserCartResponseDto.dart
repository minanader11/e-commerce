import 'package:e_commerce/data/model/response/AddOrGetToCartResponseDto.dart';
import 'package:e_commerce/domain/entities/GetUserCartResponseEntity.dart';

class GetUserCartResponseDto extends GetUserCartResponseEntity{
  GetUserCartResponseDto({
      super.status,
      super.numOfCartItems,
      super.data,this.message,
    this.statusMsg});

  GetUserCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    message = json['message'];
    statusMsg=json['statusMsg'];
    data = json['data'] != null ? AddOrGetToCartResponseDataDto.fromJson(json['data']) : null;
  }

  String? statusMsg;
  String? message;



}



