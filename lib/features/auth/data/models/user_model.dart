import 'package:weather_app/features/auth/domain/entities/user.dart';

class UserModel extends MyUser {
  UserModel({required super.id, required super.email, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']??"",
      email: map['email']??"",
      name: map['name']??"",
    );
  }

}
