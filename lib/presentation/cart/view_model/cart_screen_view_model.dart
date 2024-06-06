import 'package:e_commerce/domain/entities/AddOrGetToCartResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/getCartUseCase.dart';
import 'package:e_commerce/domain/use_cases/removeProductFromCartUseCase.dart';
import 'package:e_commerce/domain/use_cases/updateProductFromCartUseCase.dart';
import 'package:e_commerce/presentation/cart/view_model/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenViewModel extends Cubit<CartScreenStates> {
  CartScreenViewModel({required this.getUserWishlistUseCase,required this.removeProductFromCartUseCase,required this.updateProductFromCartUseCase})
      : super(CartScreenInitialState());
  GetCartUseCase getUserWishlistUseCase;
  List<AddOrGetToCartResponseProductsEntity> cartProducts = [];
  RemoveProductFromCartUseCase removeProductFromCartUseCase;
  UpdateProductFromCartUseCase updateProductFromCartUseCase;
  num cartPrice=0;
  num numberOfCartItems=0;
  void getCart(String token) async {
    emit(GetCartLoadingState());
    var response = await getUserWishlistUseCase.invoke(token);
    response.fold((l) {
      emit(GetCartFailureState(errMsg: l.errMsg));
    }, (r) {
      numberOfCartItems=r.numOfCartItems!;
      cartProducts = r.data!.products!;
      cartPrice=r.data!.totalCartPrice!;
      emit(GetCartSuccessState());
    });
  }
  void removeProductFromCart(String productId,String token)async{
    emit(RemoveProductFromCartLoadingState());
    var response=await removeProductFromCartUseCase.invoke(productId, token);
    response.fold((l) {
      emit(RemoveProductFromCartFailureState(errMsg: l.errMsg));
    }, (r) {
      cartProducts.removeWhere((element) => element.product!.id==productId);
      cartPrice=r.data!.totalCartPrice!;
      emit(RemoveProductFromCartSuccessState());
    });
  }
  void updateProductFromCart(String token,String productId,String count) async {
    emit(UpdateProductFromCartLoadingState());
    var response = await updateProductFromCartUseCase.invoke(productId, token, count);
    response.fold((l) {
      emit(UpdateProductFromCartFailureState(errMsg: l.errMsg));
    }, (r) {
      cartProducts = r.data!.products!;
      cartPrice=r.data!.totalCartPrice!;
      emit(UpdateProductFromCartSuccessState());
    });
  }

}
