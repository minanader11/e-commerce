import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/data/model/request/AddToCartRequestDto.dart';
import 'package:e_commerce/data/model/request/AddToWishlistRequestDto.dart';
import 'package:e_commerce/data/model/request/loginRequestDto.dart';
import 'package:e_commerce/data/model/request/registerRequestDto.dart';
import 'package:e_commerce/data/model/request/updateProductFromCartRequest.dart';
import 'package:e_commerce/data/model/response/AddOrGetToCartResponseDto.dart';
import 'package:e_commerce/data/model/response/AddToCartResponseDto.dart';
import 'package:e_commerce/data/model/response/AddToWishlistResponseDto.dart';
import 'package:e_commerce/data/model/response/CategoriesOrBrandResponseDto.dart';
import 'package:e_commerce/data/model/response/GetUserCartResponseDto.dart';
import 'package:e_commerce/data/model/response/GetUserWishlistResponseDto.dart';
import 'package:e_commerce/data/model/response/ProductResponseDto.dart';
import 'package:e_commerce/data/model/response/RemoveProductFromCartResponseDto.dart';
import 'package:e_commerce/data/model/response/RemoveProductFromWishlistResponseDto.dart';
import 'package:e_commerce/data/model/response/authenticationResponseDto.dart';

import 'package:e_commerce/domain/entities/failure.dart';
import 'package:http/http.dart' as http;
class ApiManager{
  static ApiManager? _instance;
ApiManager._();
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }
  Future<Either<Failures,AuthenticationResponseDto>>register(String email,String name,String phoneNumber,String password,String rePassword) async{
   var connectivityResult =
   await Connectivity().checkConnectivity(); // User defined class
   if (connectivityResult.contains(ConnectivityResult.mobile) ||
       connectivityResult.contains(ConnectivityResult.wifi)){
   Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.signUpApi);
   var registerRequest= RegisterRequestDto(email: email,password: password,name: name,phone: phoneNumber,rePassword: rePassword);
   var respone =await http.post(url,body: registerRequest.toJson());
   var registerResponse= AuthenticationResponseDto.fromJson(jsonDecode(respone.body));
   if(respone.statusCode>=200 && respone.statusCode <300 ){
     return Right(registerResponse);
   }else{
     return Left(ServerFailure(errMsg: registerResponse.message!));
   }
   } else{
     return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
   }
 }
  Future<Either<Failures,AuthenticationResponseDto>>login(String email,String password) async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.signInApi);
      var loginRequest= LoginRequestDto(password: password,email: email);
      var response =await http.post(url,body: loginRequest.toJson());
      var loginResponse= AuthenticationResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(loginResponse);
      }else{
        return Left(ServerFailure(errMsg: loginResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,CategoriesOrBrandResponseDto>>getCategories() async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getCategoriesApi);

      var response =await http.get(url);
      var categoriesResponse=CategoriesOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(categoriesResponse);
      }else{
        return Left(ServerFailure(errMsg: categoriesResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,CategoriesOrBrandResponseDto>>getBrands() async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getBrandsApi);

      var response =await http.get(url);
      var categoriesResponse=CategoriesOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(categoriesResponse);
      }else{
        return Left(ServerFailure(errMsg: categoriesResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,ProductResponseDto>>getProducts([String? categoryId]) async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Map<String, dynamic>? params= {};
      categoryId != null ? params={'category[in]': categoryId} : params={};
      Uri url =  Uri.https(ApiConstants.baseUrl, ApiConstants.getProductsApi,params);

      var response =await http.get(url);
      var productResponse=ProductResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(productResponse);
      }else{
        return Left(ServerFailure(errMsg:productResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,AddToCartResponseDto>>addToCart(String productId,String token) async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCart);
       var addToCartRequest=AddToCartRequestDto(productId: productId);
      var response =await http.post(url,body:addToCartRequest.toJson() ,headers: {
        'token': token
      });
      var addToCartResponse=AddToCartResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        print(addToCartResponse.message);
        return Right(addToCartResponse);
      }else{
        print(addToCartResponse.message);
        return Left(ServerFailure(errMsg:addToCartResponse.message!));
      }
    } else{

      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,AddToWishlistResponseDto>>addToWishlist(String productId,String token) async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToWishlist);
      var addToCartRequest=AddToWishlistRequestDto(productId: productId);
      var response =await http.post(url,body:addToCartRequest.toJson() ,headers: {
        'token': token
      });
      var addToWishlistResponse=AddToWishlistResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(addToWishlistResponse);
      }else{
        return Left(ServerFailure(errMsg:addToWishlistResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,GetUserWishlistResponseDto>>getWishlist(String token) async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getWishlist);

      var response =await http.get(url,headers: {
        'token': token
      });
      var getWishlistResponse=GetUserWishlistResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(getWishlistResponse);
      }else{
        return Left(ServerFailure(errMsg:getWishlistResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,GetUserCartResponseDto>>getCart(String token) async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getUserCart);

      var response =await http.get(url,headers: {
        'token': token
      });
      var getUserCartResponse=GetUserCartResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(getUserCartResponse);
      }else{
        return Left(ServerFailure(errMsg:getUserCartResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,RemoveProductFromWishlistResponseDto>>removeFromWishlist(String productId,String token) async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, '${ApiConstants.addToWishlist}/$productId');

      var response =await http.delete(url,headers: {
        'token': token
      });
      var removeProductFromWishlistResponse=RemoveProductFromWishlistResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(removeProductFromWishlistResponse);
      }else{
        return Left(ServerFailure(errMsg:removeProductFromWishlistResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,RemoveProductFromCartResponseDto>>removeFromCart(String productId,String token) async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, '${ApiConstants.getUserCart}/$productId');

      var response =await http.delete(url,headers: {
        'token': token
      });
      var removeProductFromCartResponse=RemoveProductFromCartResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(removeProductFromCartResponse);
      }else{
        return Left(ServerFailure(errMsg:removeProductFromCartResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }
  Future<Either<Failures,AddOrGetToCartResponseDto>>updateProductFromCart(String productId,String token,String count) async{
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl, '${ApiConstants.getUserCart}/$productId');
      var updateProductRequest= UpdateProductFromCartRequest(count: count);
      var response =await http.put(url,body: updateProductRequest.toJson(),headers: {
        'token': token
      });
      var updateProductFromCartResponse=AddOrGetToCartResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode <300 ){
        return Right(updateProductFromCartResponse);
      }else{
        return Left(ServerFailure(errMsg:updateProductFromCartResponse.message!));
      }
    } else{
      return Left(NetworkFailure(errMsg: 'Check Your Internet Connection'));
    }
  }

}