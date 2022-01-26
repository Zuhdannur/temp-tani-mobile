import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'anggaran.dart';
import 'base_response.dart';

part 'summary.g.dart';

@JsonSerializable()
class Summary {

	static Summary fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);
	Map<String, dynamic> toJson() => _$SummaryToJson(this);

  int? keuntungan;
  int? pendapatan;
  int? pengeluaran;
  Anggaran? anggaran;

  Summary({this.keuntungan, this.pendapatan, this.pengeluaran, this.anggaran}){
    repository = locator<Repository>();
  }

  @JsonKey(ignore: true)
  late Repository repository;

  static Summary get instance => Summary();

  Future<Summary?> fetch({required int id}) async {
    try{
      var response = await repository.fetchSummary(id: id);
      var result = BaseResponse<Summary>.fromJson(response, Summary.fromJson);
      return result.data;
    }catch(e){
      return null;
    }
  }

}