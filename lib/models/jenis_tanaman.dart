import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
part 'jenis_tanaman.g.dart';

@JsonSerializable()
class JenisTanaman {

	static JenisTanaman fromJson(Map<String, dynamic> json) => _$JenisTanamanFromJson(json);
	Map<String, dynamic> toJson() => _$JenisTanamanToJson(this);
  int? id;

  @JsonKey(name: "nama_jenistanaman")
  String? namaJenistanaman;

  @JsonKey(name: "harga_jual")
  int? hargaJual;

  @JsonKey(name: "created_at")
  String? createdAt;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  JenisTanaman(
      {this.id,
        this.namaJenistanaman,
        this.hargaJual,
        this.createdAt,
        this.updatedAt}){
    repository = locator<Repository>();
  }

  @JsonKey(ignore: true)
  static JenisTanaman get instance => JenisTanaman();

  @JsonKey(ignore: true)
  late Repository repository;

  Future<List<JenisTanaman>?> fetchAll() async {
    try{
      var response = await repository.fetchAllJenisTanaman();
      var result = BaseResponse<List<JenisTanaman>>.fromJson(response, (json){
        final items = json.cast<Map<String, dynamic>>();
        return List<JenisTanaman>.from(items.map((itemsJson) => JenisTanaman.fromJson(itemsJson)));
      });
      return result.data;
    }catch(e){
      return null;
    }
  }
}