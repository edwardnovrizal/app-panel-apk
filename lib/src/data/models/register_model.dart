import 'package:panel_apk/src/domain/entities/register_entity.dart';

class RegisterResponeModel extends RegisterResponeEntity {
  const RegisterResponeModel({
    required super.success,
    required super.code,
    required super.message,
  });

  RegisterResponeModel.fromJson(Map<String, dynamic> json)
      : super(
          success: json['success'],
          code: json['code'],
          message: json['message'],
        );
}
