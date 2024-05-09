import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';

class CategoriesOrBrandResponseDto  extends CategoriesOrBrandsResponseEntity{
  CategoriesOrBrandResponseDto({
      super.results,
      super.metadata,
      super.data,
  this.message,
  this.statusMsg});

  CategoriesOrBrandResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg=json['statusMsg'];
    metadata = json['metadata'] != null ? MetadataDto.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CateogryOrBrandDataDto.fromJson(v));
      });
    }
  }
  String? statusMsg;
  String? message;



}

class CateogryOrBrandDataDto extends CateogryOrBrandDataEntity{
  CateogryOrBrandDataDto({
      super.id,
      super.name,
      super.slug,
      super.image,
      super.createdAt,
      super.updatedAt,});

  CateogryOrBrandDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class MetadataDto extends MetadataEntity{
  MetadataDto({
      super.currentPage,
      super.numberOfPages,
      super.limit,});

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}