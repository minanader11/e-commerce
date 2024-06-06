class UpdateProductFromCartRequest {
  UpdateProductFromCartRequest({
      this.count,});


  String? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }

}