// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_anggaran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailAnggaran _$DetailAnggaranFromJson(Map<String, dynamic> json) =>
    DetailAnggaran(
      idAnggaran: json['id_anggaran'] as int?,
      namaKategori: json['nama_kategori'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
      deskripsi: json['deskripsi'] as String?,
      itemAnggaran: (json['item_anggaran'] as List<dynamic>?)
          ?.map((e) => ItemAnggaran.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalBiayaKategori: json['total_biaya_kategori'] as int?,
    );

Map<String, dynamic> _$DetailAnggaranToJson(DetailAnggaran instance) =>
    <String, dynamic>{
      'id_anggaran': instance.idAnggaran,
      'nama_kategori': instance.namaKategori,
      'total_biaya_kategori': instance.totalBiayaKategori,
      'deskripsi': instance.deskripsi,
      'item_anggaran': instance.itemAnggaran,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
