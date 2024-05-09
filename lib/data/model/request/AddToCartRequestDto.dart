class AddToCartRequestDto {
  AddToCartRequestDto({
      this.productId,});


  String? productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = productId;
    return map;
  }

}