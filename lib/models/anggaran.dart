import 'package:flutter/material.dart';
import 'package:hitungtani/models/detail_anggaran.dart';
import 'package:hitungtani/models/response_no_data.dart';
import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
part 'anggaran.g.dart';

@JsonSerializable()
class Anggaran {

	static Anggaran fromJson(Map<String, dynamic> json) => _$AnggaranFromJson(json);
	Map<String, dynamic> toJson() => _$AnggaranToJson(this);

	@JsonKey(name: "id_kebun")
  int? idKebun;

  String? tahun;

  @JsonKey(name: "total_biaya_keseluruhan")
  int? totalBiayaKeseluruhan;

  int? pendapatan;

  int? keuntungan;

  @JsonKey(name: "detail_anggaran")
  List<DetailAnggaran>? detailAnggaran;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  @JsonKey(name: "created_at")
  String? createdAt;
  int? id;

  @JsonKey(ignore: true)
  TextEditingController tahunController = TextEditingController();

  Anggaran({this.idKebun, this.tahun, this.updatedAt, this.createdAt, this.id, this.detailAnggaran, this.keuntungan, this.pendapatan, this.totalBiayaKeseluruhan}){
    repository = locator<Repository>();
    if(tahun!=null) tahunController.text = tahun?.toString()??"";
  }

  @JsonKey(ignore: true)
  late Repository repository;

  static Anggaran get instance => Anggaran();

  Future<List<Anggaran>?> fetchAll({required int id}) async {
    try{
      var response = await repository.fetchAllAnggaran(params: {"id_kebun": id});
      var result = BaseResponse<List<Anggaran>>.fromJson(response, (json){
        final items = json.cast<Map<String, dynamic>>();
        return List<Anggaran>.from(items.map((itemsJson) => Anggaran.fromJson(itemsJson)));
      });
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<Anggaran?> fetchOne({required int id}) async {
    try{
      var response = await repository.fetchOneAnggaran(id: id);
      var result = BaseResponse<Anggaran>.fromJson(response, Anggaran.fromJson);
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> create({required int id}) async {
    try{
      var response = await repository.createAnggaran(body: {
        "id_kebun": id,
        "tahun": tahun
      });

      return BaseResponse<Anggaran>.fromJson(response, Anggaran.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> update() async {
    try{
      var response = await repository.updateAnggaran(body: {
        "tahun": tahun
      }, id: this.id??0);

      return BaseResponse<Anggaran>.fromJson(response, Anggaran.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<ResponseNoData?> delete() async {
    try{
      var response = await repository.deleteAnggaran(id: this.id??0);
      return ResponseNoData.fromJson(response);
    }catch(e){
      return null;
    }
  }


}