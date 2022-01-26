// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_anggaran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemAnggaran _$ItemAnggaranFromJson(Map<String, dynamic> json) => ItemAnggaran(
      idKategori: json['id_kategori'] as int?,
      namaSubKategori: json['nama_sub_kategori'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
      deskripsi: json['deskripsi'] as String?,
      barang: (json['barang'] as List<dynamic>?)
          ?.map((e) => Barang.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalBiayaSubKategori: json['total_biaya_sub_kategori'] as int?,
    );

Map<String, dynamic> _$ItemAnggaranToJson(ItemAnggaran instance) =>
    <String, dynamic>{
      'id_kategori': instance.idKategori,
      'nama_sub_kategori': instance.namaSubKategori,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'total_biaya_sub_kategori': instance.totalBiayaSubKategori,
      'deskripsi': instance.deskripsi,
      'barang': instance.barang,
    };
