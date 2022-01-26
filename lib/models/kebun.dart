import 'package:flutter/material.dart';
import 'package:hitungtani/models/base_response.dart';
import 'package:hitungtani/models/jenis_tanaman.dart';
import 'package:hitungtani/models/response_no_data.dart';
import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:json_annotation/json_annotation.dart';
part 'kebun.g.dart';

@JsonSerializable()
class Kebun {

	static Kebun fromJson(Map<String, dynamic> json) => _$KebunFromJson(json);
	Map<String, dynamic> toJson() => _$KebunToJson(this);
  int? id;

  @JsonKey(name: "id_jenistanaman")
  int? idJenistanaman;

  @JsonKey(name: "nama_kebun")
  String? namaKebun;

  @JsonKey(name: "luas_lahan")
  int? luasLahan;

  @JsonKey(name: "jarak_tanam")
  int? jarakTanam;

  @JsonKey(name: "hasil_panen_per_ubin")
  int? hasilPanenPerUbin;

  @JsonKey(name: "total_populasi_tanaman")
  int? totalPopulasiTanaman;

  @JsonKey(name: "perkiraan_jumlah_hasil_panen")
  int? perkiraanJumlahHasilPanen;

  @JsonKey(name: "harga_satuan_per_hasil_panen")
  int? hargaSatuanPerHasilPanen;

  @JsonKey(name: "created_at")
  String? createdAt;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  String? latitude;
  String? longitude;
  String? alamat;
  int? idUser;

  @JsonKey(name: "waktu_penanaman")
  int? waktuPenanaman;

  @JsonKey(name: "jenis_tanaman")
  JenisTanaman? jenisTanaman;

  @JsonKey(ignore: true)
  TextEditingController namaKebunController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController alamatController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController jarakTanamController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController luasLahanController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController waktuPenanamanController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController hasilPanenController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController hargaSatuanController = TextEditingController();

  @JsonKey(ignore: true)
  late Repository repository;

  static Kebun get instance => Kebun();

  Kebun(
      {this.id,
        this.idJenistanaman,
        this.namaKebun,
        this.luasLahan,
        this.jarakTanam,
        this.hasilPanenPerUbin,
        this.totalPopulasiTanaman,
        this.perkiraanJumlahHasilPanen,
        this.hargaSatuanPerHasilPanen,
        this.createdAt,
        this.updatedAt,
        this.latitude,
        this.longitude,
        this.alamat,
        this.idUser,
        this.waktuPenanaman,
        this.jenisTanaman
      }){
    repository = locator<Repository>();
    if(namaKebun!=null) namaKebunController.text = namaKebun?.toString() ?? "";
    if(luasLahan!=null) luasLahanController.text = luasLahan?.toString() ?? "";
    if(jarakTanam!=null) jarakTanamController.text = jarakTanam?.toString() ?? "";
    if(hasilPanenPerUbin!=null) hasilPanenController.text = hasilPanenPerUbin?.toString() ?? "";
    if(alamat!=null) alamatController.text = alamat?.toString() ?? "";
    if(waktuPenanaman!=null) waktuPenanamanController.text = waktuPenanaman?.toString() ?? "";
    if(hargaSatuanPerHasilPanen!=null) hargaSatuanController.text = hargaSatuanPerHasilPanen?.toString() ?? "";
  }

  Future<List<Kebun>?> fetchAll() async {
    try{
      var response = await repository.fetchAllKebun();
      var result = BaseResponse<List<Kebun>>.fromJson(response, (json){
        final items = json.cast<Map<String, dynamic>>();
        return List<Kebun>.from(items.map((itemsJson) => Kebun.fromJson(itemsJson)));
      });
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<Kebun?> fetchOne({required int id}) async {
    try{
      var response = await repository.fetchOneKebun(id: id);
      var result = BaseResponse<Kebun>.fromJson(response, Kebun.fromJson);
      return result.data;
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> create() async {
    try{
      var response = await repository.createKebun(body: {
        "nama_kebun": this.namaKebun,
        "alamat": this.alamat,
        "latitude": "123",
        "longitude": "123",
        "id_jenistanaman": 1,
        "luas_lahan": this.luasLahan,
        "jarak_tanam": this.jarakTanam,
        "waktu_penanaman": this.waktuPenanaman,
        "hasil_panen_per_ubin": this.hasilPanenPerUbin,
        "harga_satuan_per_hasil_panen": this.hargaSatuanPerHasilPanen,
      });

      return BaseResponse<Kebun>.fromJson(response, Kebun.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> update() async {
    try{
      var response = await repository.updateKebun(body: {
        "nama_kebun": this.namaKebun,
        "alamat": this.alamat,
        "latitude": "123",
        "longitude": "123",
        "id_jenistanaman": 1,
        "luas_lahan": this.luasLahan,
        "jarak_tanam": this.jarakTanam,
        "waktu_penanaman": this.waktuPenanaman,
        "hasil_panen_per_ubin": this.hasilPanenPerUbin,
        "harga_satuan_per_hasil_panen": this.hargaSatuanPerHasilPanen,
      }, id: this.id??0);

      return BaseResponse<Kebun>.fromJson(response, Kebun.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<ResponseNoData?> delete() async {
    try{
      var response = await repository.deleteKebun(id: this.id??0);
      return ResponseNoData.fromJson(response);
    }catch(e){
      return null;
    }
  }
}