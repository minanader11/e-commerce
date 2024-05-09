import 'package:e_commerce/domain/entities/productResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/addToCartUseCase.dart';
import 'package:e_commerce/domain/use_cases/getProductsUseCase.dart';
import 'package:e_commerce/presentation/category/view_model/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewModel extends Cubit<CategoryStates>{
  CategoryViewModel({required this.getProductsUseCase,required this.addToCartUseCase}):super(CategoryInitialState());
  GetProductsUseCase getProductsUseCase;
  List<ProductEntity> products=[];
  AddToCartUseCase addToCartUseCase;
  String badgeNumber='0';
  void getProducts()async{
    emit(CategoryLoadingState());
    var either = await getProductsUseCase.invoke();
    either.fold((l) {
      print('error');
      emit(CategoryFailureState(errMsg: l.errMsg));
    }, (r) {
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
}