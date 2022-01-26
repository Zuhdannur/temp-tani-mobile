import 'package:hitungtani/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse{
  String? token;
  User? user;

  LoginResponse({this.user, this.token});

  static LoginResponse fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}