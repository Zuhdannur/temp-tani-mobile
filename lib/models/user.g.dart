// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int?,
      namaLengkap: fields[1] as String?,
      email: fields[2] as String?,
      tanggalLahir: fields[3] as String?,
      role: fields[4] as int?,
      createdAt: fields[5] as String?,
      updatedAt: fields[6] as String?,
      telepon: fields[7] as String?,
      token: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.namaLengkap)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.tanggalLahir)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.telepon)
      ..writeByte(8)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      namaLengkap: json['nama_lengkap'] as String?,
      email: json['email'] as String?,
      tanggalLahir: json['tanggal_lahir'] as String?,
      role: json['role'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      telepon: json['telepon'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.namaLengkap,
      'email': instance.email,
      'tanggal_lahir': instance.tanggalLahir,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'telepon': instance.telepon,
      'token': instance.token,
    };
