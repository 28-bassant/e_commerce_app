import 'package:e_commerce_app/domain/entities/response/user_dto.dart';

import '../model/response/user.dart';

extension UserMapper on User{
  UserDto toUserDto(){
    return UserDto(name: name, email: email);
  }
}