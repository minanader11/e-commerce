import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/GetUserWishlistResponseEntity.dart';
import 'package:e_commerce/domain/entities/productResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/addToCartUseCase.dart';
import 'package:e_commerce/domain/use_cases/getUserWishlistUseCase.dart';
import 'package:e_commerce/domain/use_cases/removeProductFromWishlistUseCase.dart';
import 'package:e_commerce/presentation/favorite/view_model/favorite_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreenViewModel extends Cubit<FavoriteScreenStates>{
  FavoriteScreenViewModel({required this.getUserWishlistUseCase,required this.addToCartUseCase,required this.removeProductFromWishlistUseCase}):super(FavoriteScreenInitialState());
  GetUserWishlistUseCase getUserWishlistUseCase;
  List<ProductEntity> favProducts=[];
  AddToCartUseCase addToCartUseCase;
  RemoveProductFromWishlistUseCase removeProductFromWishlistUseCase;
  void getUserWishlist(String token)async{
    emit(GetWishlistLoadingState());
    var response= await getUserWishlistUseCase.invoke(token);
    response.fold((l){
      emit(GetWishlistFailureState(errMsg: l.errMsg));
    }, (r) {
      favProducts=r.data!;
      emit(GetWishlistSuccessState());
    });
  }
  void addToCart(String productId,String token)async{
    emit(AddToCartInFavoriteLoadingState());
    var either = await addToCartUseCase.invoke(productId, token);
    either.fold((l) {
      emit(AddToCartInFavoriteFailureState(errMsg: l.errMsg));
    }, (r) {

      emit(AddToCartInFavoriteSuccessState());
    });
  }
  void removeProductFromWishlist(String productId,String token)async{
    emit(RemoveProductLoadingState());
    var either=await removeProductFromWishlistUseCase.invoke(productId, token);
    either.fold((l) {
      emit(RemoveProductFailureState(errMsg: l.errMsg));
    }, (r) {
     favProducts.removeWhere((element) => element.id==productId);
      emit(RemoveProductSuccessState());
    });
  }
}