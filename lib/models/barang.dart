import 'package:flutter/cupertino.dart';
import 'package:hitungtani/models/response_no_data.dart';
import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
part 'barang.g.dart';

@JsonSerializable()
class Barang {

  static Barang fromJson(Map<String, dynamic> json) => _$BarangFromJson(json);
	Map<String, dynamic> toJson() => _$BarangToJson(this);

	@JsonKey(name: "id_sub_kategori")
  int? idSubKategori;

  @JsonKey(name: "nama_barang")
  String? namaBarang;

  int? kuantitas;
  String? satuan;
  String? deskripsi;

  @JsonKey(name: "jumlah_biaya")
  int? jumlahBiaya;

  @JsonKey(name: "update_at")
  String? updatedAt;

  @JsonKey(name: "created_at")
  String? createdAt;
  int? id;

  @JsonKey(ignore: true)
  TextEditingController namaBarangController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController kuantitasController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController satuanController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController jumlahBiayaController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController deskripsiController = TextEditingController();

  Barang(
      {this.idSubKategori,
        this.namaBarang,
        this.kuantitas,
        this.satuan,
        this.jumlahBiaya,
        this.updatedAt,
        this.createdAt,
        this.deskripsi,
        this.id}){
    repository = locator<Repository>();
    if(namaBarang!=null) namaBarangController.text = namaBarang?.toString()??"";
    if(kuantitas!=null) kuantitasController.text = kuantitas?.toString()??"";
    if(satuan!=null) satuanController.text = satuan?.toString()??"";
    if(jumlahBiaya!=null) jumlahBiayaController.text = jumlahBiaya?.toString()??"";
    if(deskripsi!=null) deskripsiController.text = deskripsi?.toString()??"";
  }

  static Barang get instance => Barang();

  @JsonKey(ignore: true)
  late Repository repository;

  Future<List<Barang>?> fetchAll({required int id}) async {
    try{
      var response = await repository.fetchAllBarang(params: {"id_sub_kategori": id});
      var result = BaseResponse<List<Barang>>.fromJson(response, (json){
        final items = json.cast<Map<String, dynamic>>();
        return List<Barang>.from(items.map((itemsJson) => Barang.fromJson(itemsJson)));
      });
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<Barang?> fetchOne({required int id}) async {
    try{
      var response = await repository.fetchOneBarang(id: id);
      var result = BaseResponse<Barang>.fromJson(response, Barang.fromJson);
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> create({required int id}) async {
    try{
      var response = await repository.createBarang(body: {
        "id_sub_kategori": id,
        "nama_barang": namaBarang,
        "kuantitas": kuantitas,
        "satuan": satuan,
        "jumlah_biaya": jumlahBiaya,
        "deskripsi": deskripsi
      });

      return BaseResponse<Barang>.fromJson(response, Barang.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> update() async {
    try{
      var response = await repository.updateBarang(body: {
        "nama_barang": namaBarang,
        "kuantitas": kuantitas,
        "satuan": satuan,
        "jumlah_biaya": jumlahBiaya,
        "deskripsi": deskripsi
      }, id: this.id??0);

      return BaseResponse<Barang>.fromJson(response, Barang.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<ResponseNoData?> delete() async {
    try{
      var response = await repository.deleteBarang(id: this.id??0);
      return ResponseNoData.fromJson(response);
    }catch(e){
      return null;
    }
  }

}