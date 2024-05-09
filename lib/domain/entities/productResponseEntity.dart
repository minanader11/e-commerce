class ProductResponseEntity {
  ProductResponseEntity({
      this.results, 
      this.metadata, 
      this.data,});


  num? results;
  MetadataProductEntity? metadata;
  List<ProductEntity>? data;



}

class ProductEntity {
  ProductEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      });


  num? sold;
  List<String>? images;
  List<SubcategoryResponseEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryResponseEntity? category;
  BrandResponseEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;




}

class BrandResponseEntity {
  BrandResponseEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});


  String? id;
  String? name;
  String? slug;
  String? image;



}

class CategoryResponseEntity {
  CategoryResponseEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;



}

class SubcategoryResponseEntity {
  SubcategoryResponseEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});


  String? id;
  String? name;
  String? slug;
  String? category;



}

class MetadataProductEntity {
  MetadataProductEntity({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;



}