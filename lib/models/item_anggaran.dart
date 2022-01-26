import 'package:flutter/material.dart';
import 'package:hitungtani/models/response_no_data.dart';
import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'barang.dart';
import 'base_response.dart';
part 'item_anggaran.g.dart';

@JsonSerializable()
class ItemAnggaran {

	static ItemAnggaran fromJson(Map<String, dynamic> json) => _$ItemAnggaranFromJson(json);
	Map<String, dynamic> toJson() => _$ItemAnggaranToJson(this);

	@JsonKey(name: "id_kategori")
  int? idKategori;

  @JsonKey(name: "nama_sub_kategori")
  String? namaSubKategori;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  @JsonKey(name: "created_at")
  String? createdAt;
  int? id;

  @JsonKey(name: "total_biaya_sub_kategori")
  int? totalBiayaSubKategori;

  String? deskripsi;

  @JsonKey(name: "barang")
  List<Barang>? barang;

  @JsonKey(ignore: true)
  TextEditingController namaSubKategoriController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController deskripsiController = TextEditingController();

  ItemAnggaran(
      {this.idKategori,
        this.namaSubKategori,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.deskripsi,
        this.barang,
        this.totalBiayaSubKategori
      }){
    repository = locator<Repository>();
    if(namaSubKategori!=null) namaSubKategoriController.text = namaSubKategori?.toString()??"";
    if(deskripsi!=null) deskripsiController.text = deskripsi?.toString()??"";
  }

  static ItemAnggaran get instance => ItemAnggaran();

  @JsonKey(ignore: true)
  late Repository repository;

  Future<List<ItemAnggaran>?> fetchAll({required int id}) async {
    try{
      var response = await repository.fetchAllItemAnggaran(params: {"id_kategori": id});
      var result = BaseResponse<List<ItemAnggaran>>.fromJson(response, (json){
        final items = json.cast<Map<String, dynamic>>();
        return List<ItemAnggaran>.from(items.map((itemsJson) => ItemAnggaran.fromJson(itemsJson)));
      });
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<ItemAnggaran?> fetchOne({required int id}) async {
    try{
      var response = await repository.fetchOneItemAnggaran(id: id);
      var result = BaseResponse<ItemAnggaran>.fromJson(response, ItemAnggaran.fromJson);
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> create({required int id}) async {
    try{
      var response = await repository.createItemAnggaran(body: {
        "id_kategori": id,
        "nama_sub_kategori": namaSubKategori,
        "deskripsi": deskripsi
      });

      return BaseResponse<ItemAnggaran>.fromJson(response, ItemAnggaran.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> update() async {
    try{
      var response = await repository.updateItemAnggaran(body: {
        "nama_sub_kategori": namaSubKategori,
        "deskripsi": deskripsi
      }, id: this.id??0);

      return BaseResponse<ItemAnggaran>.fromJson(response, ItemAnggaran.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<ResponseNoData?> delete() async {
    try{
      var response = await repository.deleteItemAnggaran(id: this.id??0);
      return ResponseNoData.fromJson(response);
    }catch(e){
      return null;
    }
  }

}