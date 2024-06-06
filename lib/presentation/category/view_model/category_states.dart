abstract class CategoryStates{}
class CategoryInitialState extends CategoryStates{}
class CategoryLoadingState extends CategoryStates{}
class CategoryFailureState extends CategoryStates{
  String errMsg;
  CategoryFailureState({required this.errMsg});
}
class CategorySuccessState extends CategoryStates{}
class AddToCartLoadingState extends CategoryStates{}
class AddToCartSuccessState extends CategoryStates{}
class AddToCartFailureState extends CategoryStates{
  String errMsg;
  AddToCartFailureState({required this.errMsg});
}
class AddToWishlistLoadingState extends CategoryStates{}
class AddToWishlistSuccessState extends CategoryStates{}
class AddToWishlistFailureState extends CategoryStates{
  String errMsg;
  AddToWishlistFailureState({required this.errMsg});
}
class GetCartLoadingState extends  CategoryStates{}
class GetCartSuccessState extends  CategoryStates{}
class GetCartFailureState extends  CategoryStates{
  String errMsg;
  GetCartFailureState({required this.errMsg});
}