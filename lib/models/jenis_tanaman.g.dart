// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jenis_tanaman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JenisTanaman _$JenisTanamanFromJson(Map<String, dynamic> json) => JenisTanaman(
      id: json['id'] as int?,
      namaJenistanaman: json['nama_jenistanaman'] as String?,
      hargaJual: json['harga_jual'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$JenisTanamanToJson(JenisTanaman instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_jenistanaman': instance.namaJenistanaman,
      'harga_jual': instance.hargaJual,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
