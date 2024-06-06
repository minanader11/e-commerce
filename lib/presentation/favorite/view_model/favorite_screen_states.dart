abstract class FavoriteScreenStates{}
class FavoriteScreenInitialState extends FavoriteScreenStates{}
class GetWishlistLoadingState extends  FavoriteScreenStates{}
class GetWishlistSuccessState extends  FavoriteScreenStates{}
class GetWishlistFailureState extends  FavoriteScreenStates{
  String errMsg;
  GetWishlistFailureState({required this.errMsg});
}
class AddToCartInFavoriteLoadingState extends FavoriteScreenStates{}
class AddToCartInFavoriteSuccessState extends FavoriteScreenStates{}
class AddToCartInFavoriteFailureState extends FavoriteScreenStates{
  String errMsg;
  AddToCartInFavoriteFailureState({required this.errMsg});
}
class RemoveProductLoadingState extends FavoriteScreenStates{}
class RemoveProductSuccessState extends FavoriteScreenStates{}
class RemoveProductFailureState extends FavoriteScreenStates{
  String errMsg;
  RemoveProductFailureState({required this.errMsg});
}