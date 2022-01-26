// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barang _$BarangFromJson(Map<String, dynamic> json) => Barang(
      idSubKategori: json['id_sub_kategori'] as int?,
      namaBarang: json['nama_barang'] as String?,
      kuantitas: json['kuantitas'] as int?,
      satuan: json['satuan'] as String?,
      jumlahBiaya: json['jumlah_biaya'] as int?,
      updatedAt: json['update_at'] as String?,
      createdAt: json['created_at'] as String?,
      deskripsi: json['deskripsi'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$BarangToJson(Barang instance) => <String, dynamic>{
      'id_sub_kategori': instance.idSubKategori,
      'nama_barang': instance.namaBarang,
      'kuantitas': instance.kuantitas,
      'satuan': instance.satuan,
      'deskripsi': instance.deskripsi,
      'jumlah_biaya': instance.jumlahBiaya,
      'update_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
