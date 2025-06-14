import '../../domain/entities/login_entity.dart';

class LoginResponeModel extends LoginResponeEntity {
  const LoginResponeModel({
    required super.success,
    required super.code,
    required super.message,
    required super.data,
  });

  LoginResponeModel.fromJson(Map<String, dynamic> json)
      : super(
          success: json['success'],
          code: json['code'],
          message: json['message'],
          data: json['data'],
        );
}
