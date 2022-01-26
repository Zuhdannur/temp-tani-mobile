import 'package:get/get.dart';

class BaseResponse<T> extends GetxController {

  final int? code;
  final String? message;
  final T? data;
  final bool? error;

  BaseResponse({this.code, this.message, this.data, this.error});

  factory BaseResponse.fromJson(Map<String, dynamic> json, Function fromJson) {
    return BaseResponse<T>(
      code: json['code'],
      message: json['message'],
      data: json['data']!=null?fromJson(json['data']):null,
      error: json['error'],
    );
  }

}
