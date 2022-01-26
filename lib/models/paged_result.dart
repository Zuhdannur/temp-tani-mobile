import 'package:get/get.dart';

class PagedResult<T> extends GetxController {

  final int? count;
  final List<T>? rows;

  PagedResult({this.count, this.rows});

  factory PagedResult.fromJson(Map<String, dynamic> json, Function fromJson) {
    final items = json['rows'].cast<Map<String, dynamic>>();
    return PagedResult<T>(
      count: json['count'],
      rows: new List<T>.from(items.map((itemsJson) => fromJson(itemsJson))),
    );
  }
}
