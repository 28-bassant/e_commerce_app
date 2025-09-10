import 'package:e_commerce_app/api/model/response/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "token")
  final String? token;

  AuthResponse ({
    this.message,
    this.user,
    this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthResponseToJson(this);
  }
}


