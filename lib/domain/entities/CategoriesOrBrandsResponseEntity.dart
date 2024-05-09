class CategoriesOrBrandsResponseEntity {
  CategoriesOrBrandsResponseEntity({
      this.results, 
      this.metadata, 
      this.data,});


  num? results;
  MetadataEntity? metadata;
  List<CateogryOrBrandDataEntity>? data;



}

class CateogryOrBrandDataEntity {
  CateogryOrBrandDataEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  CateogryOrBrandDataEntity.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;



}

class MetadataEntity {
  MetadataEntity({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});
  num? currentPage;
  num? numberOfPages;
  num? limit;

}