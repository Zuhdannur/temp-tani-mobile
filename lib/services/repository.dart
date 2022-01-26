import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:hitungtani/controllers/akun_controller.dart';
import 'package:hitungtani/services/logging_interceptor.dart';

class Repository{
  String baseUrl = "${FlutterConfig.get("API_BASE_URL")}";

  Dio dio;
  Dio tokenDio;

  Repository({required this.dio, required this.tokenDio}){
    dio.options.baseUrl = baseUrl;
    tokenDio.options.baseUrl = baseUrl;
    dio.interceptors.add(LoggingInterceptors());
    tokenDio.interceptors.add(LoggingInterceptors());
    dio.options.connectTimeout = 60*2000;
    dio.options.receiveTimeout = 60*2000;
    tokenDio.options.connectTimeout = 60*2000;
    tokenDio.options.receiveTimeout = 60*2000;
  }

  Future register({required Map<String, dynamic> body}) async {
    // dio.options.baseUrl = "http://192.168.100.110:8000/web-and-api/public/api/";
    try{
      final response = await dio.post("register", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future login({required Map<String, dynamic> body}) async {
    // dio.options.baseUrl = "http://192.168.100.110:8000/web-and-api/public/api/";
    try{
      final response = await dio.post("login", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchAllJenisTanaman() async {
    try{
      final response = await tokenDio.get("jenis_tanaman");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchAllKebun() async {
    try{
      final response = await tokenDio.get("kebun");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchOneKebun({required int id}) async {
    try{
      final response = await tokenDio.get("kebun/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future createKebun({required Map<String, dynamic> body}) async {
    try{
      final response = await tokenDio.post("kebun", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future updateKebun({required Map<String, dynamic> body, required int id}) async {
    try{
      final response = await tokenDio.put("kebun/$id", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future deleteKebun({required int id}) async {
    try{
      final response = await tokenDio.delete("kebun/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchAllAnggaran({required Map<String, dynamic> params}) async {
    try{
      final response = await tokenDio.get("anggaran", queryParameters: params);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchOneAnggaran({required int id}) async {
    try{
      final response = await tokenDio.get("anggaran/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future createAnggaran({required Map<String, dynamic> body}) async {
    try{
      final response = await tokenDio.post("anggaran", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future updateAnggaran({required Map<String, dynamic> body, required int id}) async {
    try{
      final response = await tokenDio.put("anggaran/$id", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future deleteAnggaran({required int id}) async {
    try{
      final response = await tokenDio.delete("anggaran/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchAllDetailAnggaran({required Map<String, dynamic> params}) async {
    try{
      final response = await tokenDio.get("detail-anggaran", queryParameters: params);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchOneDetailAnggaran({required int id}) async {
    try{
      final response = await tokenDio.get("detail-anggaran/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future createDetailAnggaran({required Map<String, dynamic> body}) async {
    try{
      final response = await tokenDio.post("detail-anggaran", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future updateDetailAnggaran({required Map<String, dynamic> body, required int id}) async {
    try{
      final response = await tokenDio.put("detail-anggaran/$id", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future deleteDetailAnggaran({required int id}) async {
    try{
      final response = await tokenDio.delete("detail-anggaran/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchAllItemAnggaran({required Map<String, dynamic> params}) async {
    try{
      final response = await tokenDio.get("item-anggaran", queryParameters: params);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchOneItemAnggaran({required int id}) async {
    try{
      final response = await tokenDio.get("item-anggaran/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future createItemAnggaran({required Map<String, dynamic> body}) async {
    try{
      final response = await tokenDio.post("item-anggaran", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future updateItemAnggaran({required Map<String, dynamic> body, required int id}) async {
    try{
      final response = await tokenDio.put("item-anggaran/$id", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future deleteItemAnggaran({required int id}) async {
    try{
      final response = await tokenDio.delete("item-anggaran/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchAllBarang({required Map<String, dynamic> params}) async {
    try{
      final response = await tokenDio.get("barang", queryParameters: params);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future fetchOneBarang({required int id}) async {
    try{
      final response = await tokenDio.get("barang/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future createBarang({required Map<String, dynamic> body}) async {
    try{
      final response = await tokenDio.post("barang", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future updateBarang({required Map<String, dynamic> body, required int id}) async {
    try{
      final response = await tokenDio.put("barang/$id", data: body);
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }

  Future deleteBarang({required int id}) async {
    try{
      final response = await tokenDio.delete("barang/$id");
      return response.data;
    }on DioError catch(e){
      throw Exception("Terjadi Kesalahan");
    }catch(e){
      print(e);
    }
  }
}