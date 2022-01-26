import 'package:get/get.dart';

class ResponseNoData extends GetxController {

  final int? code;
  final String? message;
  final bool? error;

  ResponseNoData({this.code, this.message, this.error});

  factory ResponseNoData.fromJson(Map<String, dynamic> json) {
    return ResponseNoData(
      code: json['code'],
      message: json['message'],
      error: json['error']
    );
  }

}
