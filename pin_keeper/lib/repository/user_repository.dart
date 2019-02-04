import 'package:pin_keeper/repository/user_entity.dart';

abstract class UserRepository{
  Future<UserEntity> login();
}