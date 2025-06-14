import '../../domain/entities/base_entity.dart';

class BaseResponseModel<T> extends BaseResponseEntity<T> {
  const BaseResponseModel({
    required super.success,
    required super.code,
    required super.message,
    required super.data,
  });

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonData,
  ) {
    return BaseResponseModel(
      success: json['success'],
      code: json['code'],
      message: json['message'],
      data: fromJsonData(json['data']),
    );
  }
}
