class AddToCartResponseEntity {
  AddToCartResponseEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});


  String? status;
  String? message;
  num? numOfCartItems;
  AddToCartResponseDataEntity? data;



}

class AddToCartResponseDataEntity {
  AddToCartResponseDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;
  List<AddToCartResponseProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;



}

class AddToCartResponseProductsEntity {
  AddToCartResponseProductsEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  AddToCartResponseProductsEntity.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  num? count;
  String? id;
  String? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}