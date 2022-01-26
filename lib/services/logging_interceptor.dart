import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hitungtani/models/response_no_data.dart';
import 'package:hitungtani/utils/helpers.dart';

class LoggingInterceptors extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl) + (options.path)}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    print(
        "<-- ${err.message}");
    print(
        "${err.response != null ? err.response!.data : 'Unknown Error'}");
    print("<-- End error");
    if(err.type != DioErrorType.cancel) {
      if (err.response != null) {
        try {
          var response = ResponseNoData.fromJson(err.response!.data);
          AppHelpers.showSnackBar(snackBarMode: SnackBarMode.ERROR,
              content: response.message ?? "-");
        } catch (e) {
          AppHelpers.showSnackBar(
              snackBarMode: SnackBarMode.ERROR, content: "Terjadi kesalahan, silakan coba kembali dalam beberapa saat.");
        }
      } else {
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.ERROR, content: "Terjadi kesalahan, silakan coba kembali dalam beberapa saat.");
      }
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    print(
        "<-- ${response.statusCode}");
    print("Headers:");
    response.headers.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    super.onResponse(response, handler);
  }
}
