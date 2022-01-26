import 'package:get/get.dart';
import 'package:hitungtani/models/paged_result.dart';

class BasePagedResponse<T> extends GetxController {

  final int? code;
  final String? message;
  final PagedResult<T>? data;
  final bool? error;

  BasePagedResponse({this.code, this.message, this.data, this.error});

  factory BasePagedResponse.fromJson(Map<String, dynamic> json, Function fromJson) {
    return BasePagedResponse<T>(
      code: json['code'],
      message: json['message'],
      data: PagedResult<T>.fromJson(json['data'], fromJson),
      error: json['error'],
    );
  }

}
