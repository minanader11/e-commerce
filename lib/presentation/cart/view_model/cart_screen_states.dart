abstract class CartScreenStates{}
class CartScreenInitialState extends CartScreenStates{}
class GetCartLoadingState extends  CartScreenStates{}
class GetCartSuccessState extends  CartScreenStates{}
class GetCartFailureState extends  CartScreenStates{
  String errMsg;
  GetCartFailureState({required this.errMsg});
}
class RemoveProductFromCartLoadingState extends  CartScreenStates{}
class RemoveProductFromCartSuccessState extends  CartScreenStates{}
class RemoveProductFromCartFailureState extends  CartScreenStates{
  String errMsg;
  RemoveProductFromCartFailureState({required this.errMsg});
}
class UpdateProductFromCartLoadingState extends  CartScreenStates{}
class UpdateProductFromCartSuccessState extends  CartScreenStates{}
class UpdateProductFromCartFailureState extends  CartScreenStates{
  String errMsg;
  UpdateProductFromCartFailureState({required this.errMsg});
}