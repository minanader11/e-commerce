abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class CategoriesLoadingState extends HomeStates{}
class CategoriesFailureState extends HomeStates{
  String errMsg;
  CategoriesFailureState({required this.errMsg});
}
class CategoriesSuccessState extends HomeStates{}
class SubCategoriesLoadingState extends HomeStates{}
class SubCategoriesFailureState extends HomeStates{
  String errMsg;
  SubCategoriesFailureState({required this.errMsg});
}
class SubCategoriesSuccessState extends HomeStates{}
class DropDownChangeItemState extends HomeStates{}