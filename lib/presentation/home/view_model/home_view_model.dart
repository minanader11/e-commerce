import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/getCategoriesUseCase.dart';
import 'package:e_commerce/domain/use_cases/getSubCategoriesUseCase.dart';
import 'package:e_commerce/presentation/home/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel({required this.getCategoriesUseCase,required this.getSubCategoriesUseCase}): super(HomeInitialState());
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getSubCategoriesUseCase;
  List<CateogryOrBrandDataEntity> categoriesList=[];
  List<CateogryOrBrandDataEntity> subCategoriesList=[];
  CateogryOrBrandDataEntity selectedBrand=CateogryOrBrandDataEntity();

  getCategories()async{
    emit(CategoriesLoadingState());
    var either=await getCategoriesUseCase.invoke();
    either.fold((l) {
      emit(CategoriesFailureState(errMsg: l.errMsg));
    }, (r){
      categoriesList=r.data!;
      emit(CategoriesSuccessState());
    });
  }
  getSubCategories()async{
    emit(SubCategoriesLoadingState());
    var either=await getSubCategoriesUseCase.invoke();
    either.fold((l) {
      emit(SubCategoriesFailureState(errMsg: l.errMsg));
    }, (r){
      subCategoriesList=r.data!;
      selectedBrand= subCategoriesList[0];
      emit(SubCategoriesSuccessState());
    });
  }
  changeItem(CateogryOrBrandDataEntity newBrand){
    emit(HomeInitialState());
    selectedBrand= newBrand;
    emit(DropDownChangeItemState());
  }
}
