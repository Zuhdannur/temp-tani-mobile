import 'package:flutter/material.dart';
import 'package:hitungtani/models/item_anggaran.dart';
import 'package:hitungtani/models/response_no_data.dart';
import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
part 'detail_anggaran.g.dart';

@JsonSerializable()
class DetailAnggaran {

	static DetailAnggaran fromJson(Map<String, dynamic> json) => _$DetailAnggaranFromJson(json);
	Map<String, dynamic> toJson() => _$DetailAnggaranToJson(this);

  @JsonKey(name: "id_anggaran")
  int? idAnggaran;

  @JsonKey(name: "nama_kategori")
  String? namaKategori;

  @JsonKey(name: "total_biaya_kategori")
  int? totalBiayaKategori;

  String? deskripsi;

  @JsonKey(name: "item_anggaran")
  List<ItemAnggaran>? itemAnggaran;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  @JsonKey(name: "created_at")
  String? createdAt;
  int? id;

  @JsonKey(ignore: true)
  TextEditingController namaKategoriController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController deskripsiController = TextEditingController();

  DetailAnggaran(
      {this.idAnggaran,
        this.namaKategori,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.deskripsi,
        this.itemAnggaran,
        this.totalBiayaKategori
      }){
    repository = locator<Repository>();
    if(namaKategori!=null) namaKategoriController.text = namaKategori?.toString()??"";
    if(deskripsi!=null) deskripsiController.text = deskripsi?.toString()??"";
  }

  static DetailAnggaran get instance => DetailAnggaran();

  @JsonKey(ignore: true)
  late Repository repository;

  Future<List<DetailAnggaran>?> fetchAll({required int id}) async {
    try{
      var response = await repository.fetchAllDetailAnggaran(params: {"id_anggaran": id});
      var result = BaseResponse<List<DetailAnggaran>>.fromJson(response, (json){
        final items = json.cast<Map<String, dynamic>>();
        return List<DetailAnggaran>.from(items.map((itemsJson) => DetailAnggaran.fromJson(itemsJson)));
      });
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<DetailAnggaran?> fetchOne({required int id}) async {
    try{
      var response = await repository.fetchOneDetailAnggaran(id: id);
      var result = BaseResponse<DetailAnggaran>.fromJson(response, DetailAnggaran.fromJson);
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> create({required int id}) async {
    try{
      var response = await repository.createDetailAnggaran(body: {
        "id_anggaran": id,
        "nama_kategori": namaKategori,
        "deskripsi": deskripsi
      });

      return BaseResponse<DetailAnggaran>.fromJson(response, DetailAnggaran.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> update() async {
    try{
      var response = await repository.updateDetailAnggaran(body: {
        "nama_kategori": namaKategori,
        "deskripsi": deskripsi
      }, id: this.id??0);

      return BaseResponse<DetailAnggaran>.fromJson(response, DetailAnggaran.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<ResponseNoData?> delete() async {
    try{
      var response = await repository.deleteDetailAnggaran(id: this.id??0);
      return ResponseNoData.fromJson(response);
    }catch(e){
      return null;
    }
  }

}