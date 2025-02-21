import 'package:dio/dio.dart';
import 'package:nyt_app/core/network/api_constants.dart';
import 'package:nyt_app/core/network/api_result.dart';
import 'package:nyt_app/core/network/env.dart';
import 'package:nyt_app/core/network/network_exceptions.dart';

class ArticlesApiServices {
  late Dio dio;

  ArticlesApiServices() {
    BaseOptions options = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10));

    dio = Dio(options);

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  Future<ApiResult<List<dynamic>>> getMostViewedArticles() async {
    try {
      Response response = await dio.get(ApiConstants.viewedArticlesEndPoint,
          queryParameters: {"api-key": Env.baseUrlKey});

      if (response.statusCode == 200 &&
          response.data['status'] == 'OK' &&
          response.data['results'] != null) {
        return ApiResult.success(response.data['results']);
      } else {
        return ApiResult.failure(NetworkExceptions.handleResponse(response));
      }
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
