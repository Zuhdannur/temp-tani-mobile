// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anggaran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anggaran _$AnggaranFromJson(Map<String, dynamic> json) => Anggaran(
      idKebun: json['id_kebun'] as int?,
      tahun: json['tahun'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
      detailAnggaran: (json['detail_anggaran'] as List<dynamic>?)
          ?.map((e) => DetailAnggaran.fromJson(e as Map<String, dynamic>))
          .toList(),
      keuntungan: json['keuntungan'] as int?,
      pendapatan: json['pendapatan'] as int?,
      totalBiayaKeseluruhan: json['total_biaya_keseluruhan'] as int?,
    );

Map<String, dynamic> _$AnggaranToJson(Anggaran instance) => <String, dynamic>{
      'id_kebun': instance.idKebun,
      'tahun': instance.tahun,
      'total_biaya_keseluruhan': instance.totalBiayaKeseluruhan,
      'pendapatan': instance.pendapatan,
      'keuntungan': instance.keuntungan,
      'detail_anggaran': instance.detailAnggaran,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
