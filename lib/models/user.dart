import 'package:flutter/cupertino.dart';
import 'package:hitungtani/models/base_response.dart';
import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'login_response.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class User {

	static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
	Map<String, dynamic> toJson() => _$UserToJson(this);

  @HiveField(0)
  int? id;

  @HiveField(1)
  @JsonKey(name: "nama_lengkap")
  String? namaLengkap;

  @HiveField(2)
  String? email;

  @HiveField(3)
  @JsonKey(name: "tanggal_lahir")
  String? tanggalLahir;

  @HiveField(4)
  int? role;

  @HiveField(5)
  @JsonKey(name: "created_at")
  String? createdAt;

  @HiveField(6)
  @JsonKey(name: "updated_at")
  String? updatedAt;

  @HiveField(7)
  String? telepon;

  @JsonKey(ignore: true)
  String? password;

  @JsonKey(ignore: true)
  String? confirmPassword;

  @HiveField(8)
  String? token;

  @JsonKey(ignore: true)
  TextEditingController namaController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController emailController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController teleponController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController passwordController = TextEditingController();

  @JsonKey(ignore: true)
  TextEditingController confirmPasswordController = TextEditingController();

  User(
      {this.id,
        this.namaLengkap,
        this.email,
        this.tanggalLahir,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.telepon,
        this.token,
        this.password
      }){
    repository = locator<Repository>();
  }

  static User get instance => User();

  @JsonKey(ignore: true)
  late Repository repository;

  Future<BaseResponse?> create() async {
    try{
      var response = await repository.register(body: {
        "nama_lengkap": this.namaLengkap,
        "email": this.email,
        "tanggal_lahir": "1999/10/10",
        "telepon": this.telepon,
        "password": this.password
      });

      return BaseResponse<User>.fromJson(response, User.fromJson);
    }catch(e){
      return null;
    }
  }

  Future<BaseResponse?> login() async {
    try{
      var response = await repository.login(body: {
        "email": this.email,
        "password": this.password
      });

      return BaseResponse<LoginResponse>.fromJson(response, LoginResponse.fromJson);
    }catch(e){
      return null;
    }
  }

}