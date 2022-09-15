// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter_application_2/Models/GetAllUser.dart';
import 'package:flutter_application_2/Models/LoginRequest.dart';
import 'package:flutter_application_2/Models/LoginResponse.dart';
import 'package:flutter_application_2/Models/RegisterRequest.dart';
import 'package:flutter_application_2/Models/RegisterResponse.dart';
import 'package:flutter_application_2/Screens/aboutme.dart';


import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'ApiService.g.dart';

// Run this code in termial to generate ApiService.g.dart file
//flutter packages pub run build_runner watch --delete-conflicting-outputs


@RestApi(baseUrl: 'http://43.204.221.33:8080/crud/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("loginUser")
  Future<LoginRes> login(@Body() LoginReq body);

  @POST("createUser")
  Future<RegisterRes>register(@Body() RegisterReq body);

  @GET("getallUser")
  Future<AllUser>alluser();

  @GET("getUser/")
  Future<LoginRes>aboutme(@Body() body);
  // @DELETE("/posts/{id}")
  // Future<void> deletePost(@Path("id") int postId);

  // @PUT("/posts/{id}")
  // Future<void> UpdatePost(@Path("id") int postId);


  /////////////////////////////////////
////////////////////////////////////////////////////////
  /// Request and Response Body
//////////////////////////////////////////////////////////////////////////////////////////

  static ApiService create() {
    final dio = Dio();
    try {
      print("check");
      dio.interceptors.add(PrettyDioLogger());
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        options.headers["Content-Type"] = "application/json";

        // options.headers["jwt"] = "08d41a36b34dadcfd6005452deb92037ad85af33b227827ae2f4e2d34b927fa0ae6a83d43cfdcff9";

        options.followRedirects = false;
        options.validateStatus = (status) {
          return status! < 500;
        };
        return handler.next(options);
      }));

      return ApiService(dio);
    } on DioError catch (error) {
      print("DioError");
      print(error);
      print(error.error);
      return ApiService(dio);
    }
  }
}
