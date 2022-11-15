// import 'package:dio/dio.dart';
// import 'package:mobx/mobx.dart';
// import 'package:retrofit/http.dart';
// import 'package:shopify/shared/utils/constants.dart';

// part 'product_service.g.dart';

// @RestApi(baseUrl: Constants.URL)
// abstract class ProductService {
//   factory ProductService(Dio dio, {String baseUrl}) = _ProductService;

//   @GET('limit={limit}&access_token=${Constants.ACCESS_TOKEN} ')
//   Future<dynamic> getProducts(
//     @Header("Authorization") String apiKey,
//     @Path() String limit,
//   );
// }
// //