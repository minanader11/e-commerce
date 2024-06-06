import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/productResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/addToCartUseCase.dart';
import 'package:e_commerce/domain/use_cases/addToWishlistUseCase.dart';
import 'package:e_commerce/domain/use_cases/getCartUseCase.dart';
import 'package:e_commerce/domain/use_cases/getProductsUseCase.dart';
import 'package:e_commerce/presentation/category/view_model/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewModel extends Cubit<CategoryStates>{
  CategoryViewModel({required this.getProductsUseCase,required this.addToCartUseCase,required this.addToWishlistUseCase,required this.getCartUseCase}):super(CategoryInitialState());
  GetProductsUseCase getProductsUseCase;
  GetCartUseCase getCartUseCase;
  List<ProductEntity> products=[];
  List<ProductEntity> filteredProducts=[];
  AddToCartUseCase addToCartUseCase;
  String badgeNumber='0';
  AddToWishlistUseCase addToWishlistUseCase;
  void getProducts([String? categoryId])async{

    emit(CategoryLoadingState());
    var either = await getProductsUseCase.invoke(categoryId);
    either.fold((l) {
      print('error');
      emit(CategoryFailureState(errMsg: l.errMsg));
    }, (r) {
      if(categoryId!=null){
        filteredProducts=r.data!;
      }
      products = r.data!;
      print('done');
      emit(CategorySuccessState());
    } );
  }
  void addToCart(String productId,String token)async{
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId, token);
    either.fold((l) {
      emit(AddToCartFailureState(errMsg: l.errMsg));
    }, (r) {
      badgeNumber=r.numOfCartItems.toString();
      emit(AddToCartSuccessState());
    });
  }
  void addToWishlist(String productId,String token)async{
    emit(AddToWishlistLoadingState());
    var either =await addToWishlistUseCase.invoke(productId, token);
    either.fold((l) {

      emit(AddToWishlistFailureState(errMsg: l.errMsg));
    }, (r) {

      emit(AddToWishlistSuccessState());
    });
  }
  void getCart(String token) async {
    emit(GetCartLoadingState());
    var response = await getCartUseCase.invoke(token);
    response.fold((l) {
      emit(GetCartFailureState(errMsg: l.errMsg));
    }, (r) {
      badgeNumber=r.numOfCartItems!.toString();


      emit(GetCartSuccessState());
    });
  }
}