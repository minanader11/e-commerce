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