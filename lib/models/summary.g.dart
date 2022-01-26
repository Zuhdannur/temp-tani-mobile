// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
      keuntungan: json['keuntungan'] as int?,
      pendapatan: json['pendapatan'] as int?,
      pengeluaran: json['pengeluaran'] as int?,
      anggaran: json['anggaran'] == null
          ? null
          : Anggaran.fromJson(json['anggaran'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'keuntungan': instance.keuntungan,
      'pendapatan': instance.pendapatan,
      'pengeluaran': instance.pengeluaran,
      'anggaran': instance.anggaran,
    };
