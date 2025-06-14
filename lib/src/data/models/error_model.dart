import 'package:panel_apk/src/domain/entities/error_entity.dart';

class ErrorResponeModel extends ErrorResponeEntity {
  const ErrorResponeModel({
    required super.success,
    required super.code,
    required super.message,
    required super.errors,
  });

  ErrorResponeModel.fromJson(Map<String, dynamic> json)
      : super(
          success: json['success'],
          code: json['code'],
          message: json['message'],
          errors: List<ErrorModel>.from(json['errors'].map((x) => ErrorModel.fromJson(x))),
        );
}

class ErrorModel {
  final String? name;
  final String? message;
  final String? path;
  final String? location;

  ErrorModel({
    this.name,
    this.message,
    this.path,
    this.location,
  });

  factory ErrorModel.fromJson(Map<String, dynamic>? json) {
    return ErrorModel(
      name: json?['name'],
      message: json?['message'],
      path: json?['path'],
      location: json?['location'],
    );
  }
}
