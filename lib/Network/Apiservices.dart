// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter_application_2/Models/Loginresponse.dart';
// import 'package:provider/provider.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:build_runner/build_runner.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:retrofit/http.dart';

// //part 'ApiService.g.dart';


// @RestApi(baseUrl: "http://43.204.221.33:8080/crud/")
// abstract class ApiServer {
//   factory ApiServer(Dio dio, {String baseUrl}) = _ApiService;

//   @POST('loginUser')
//   Future<LoginReq> login(@Body() LoginReq body);

//   static ApiServer create() {
//     final dio = Dio();
//     try {
//       print("dio worked");
//       dio.interceptors.add(PrettyDioLogger());
//       dio.interceptors
//           .add(InterceptorsWrapper(onRequest: (options, handler) async {
//         options.headers["Content-Type"] = "application/json";
//         options.followRedirects = false;
//         options.validateStatus = (status) {
//           return status! < 500;
//         };
//         return handler.next(options);
//       }));
//       return ApiServer(dio);
//     } on DioError catch (error) {
//       print("DioError");
//       print(error);
//       print(error.error);
//       return ApiServer(dio);
//     }
//   }
// }

// // import 'package:dio/dio.dart';
// // import 'package:retrofit/http.dart';
// // import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// // import '../Models/LoginResponse.dart';



// // part 'ApiService.g.dart';

// // //flutter packages pub run build_runner watch --delete-conflicting-outputs
// // class Apis {
// //   static const String getall = '/getall';
// // }

// // @RestApi(baseUrl: "http://54.88.43.153:6500/")
// // abstract class ApiClient {
// //   factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

// //   @POST('login')
// //   Future<LoginReq> login(@Body() LoginReq body);


// //   static ApiClient create() {
// //     final dio = Dio();
// //     try {
// //       print("check");
// //       dio.interceptors.add(PrettyDioLogger());
// //       dio.interceptors
// //           .add(InterceptorsWrapper(onRequest: (options, handler) async {
// //         options.headers["Content-Type"] = "application/json";
// //         options.followRedirects = false;
// //         options.validateStatus = (status) {
// //           return status! < 500;
// //         };
// //         return handler.next(options);
// //       }));
// //       return ApiClient(dio);
// //     } on DioError catch (error) {
// //       print("DioError");
// //       print(error);
// //       print(error.error);
// //       return ApiClient(dio);
// //     }
// //   }
// // }
