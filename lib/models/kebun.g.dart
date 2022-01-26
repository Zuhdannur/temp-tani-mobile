// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kebun.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kebun _$KebunFromJson(Map<String, dynamic> json) => Kebun(
      id: json['id'] as int?,
      idJenistanaman: json['id_jenistanaman'] as int?,
      namaKebun: json['nama_kebun'] as String?,
      luasLahan: json['luas_lahan'] as int?,
      jarakTanam: json['jarak_tanam'] as int?,
      hasilPanenPerUbin: json['hasil_panen_per_ubin'] as int?,
      totalPopulasiTanaman: json['total_populasi_tanaman'] as int?,
      perkiraanJumlahHasilPanen: json['perkiraan_jumlah_hasil_panen'] as int?,
      hargaSatuanPerHasilPanen: json['harga_satuan_per_hasil_panen'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      alamat: json['alamat'] as String?,
      idUser: json['idUser'] as int?,
      waktuPenanaman: json['waktu_penanaman'] as int?,
      jenisTanaman: json['jenis_tanaman'] == null
          ? null
          : JenisTanaman.fromJson(
              json['jenis_tanaman'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KebunToJson(Kebun instance) => <String, dynamic>{
      'id': instance.id,
      'id_jenistanaman': instance.idJenistanaman,
      'nama_kebun': instance.namaKebun,
      'luas_lahan': instance.luasLahan,
      'jarak_tanam': instance.jarakTanam,
      'hasil_panen_per_ubin': instance.hasilPanenPerUbin,
      'total_populasi_tanaman': instance.totalPopulasiTanaman,
      'perkiraan_jumlah_hasil_panen': instance.perkiraanJumlahHasilPanen,
      'harga_satuan_per_hasil_panen': instance.hargaSatuanPerHasilPanen,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'alamat': instance.alamat,
      'idUser': instance.idUser,
      'waktu_penanaman': instance.waktuPenanaman,
      'jenis_tanaman': instance.jenisTanaman,
    };
