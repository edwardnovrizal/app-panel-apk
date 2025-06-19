import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/data/models/appinfo_model.dart';

import '../../../commons/exeption.dart';
import '../../../commons/failure.dart';
import '../../../config/api_config.dart';
import '../../models/base_model.dart';

abstract class AppinfoDatasource {
  Future<BaseResponseModel<List<AppInfoModel>>> readAppInfo({required String token, required String projectId});
  Future<BaseResponseModel<AppInfoModel>> create({
    required String? token,
    required String? projectId,
    String? name,
    String? version,
    String? telegram,
    String? whatsapp,
    String? email,
    XFile? thumbnail,
  });
  Future<BaseResponseModel<AppInfoModel>> delete(
      {required String token, required String appinfoId, required String projectId});
}

class AppinfoDatasourceImpl extends AppinfoDatasource {
  final Dio _dio;
  AppinfoDatasourceImpl()
      : _dio = Dio(BaseOptions(
          sendTimeout: const Duration(milliseconds: 6000),
          contentType: 'application/json',
          baseUrl: ConfigApi.baseAuth,
        )) {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: false,
      error: true,
    ));
  }
  @override
  Future<BaseResponseModel<List<AppInfoModel>>> readAppInfo({required String token, required String projectId}) async {
    try {
      final respone = await _dio.get(
        ConfigApi.appinfo,
        queryParameters: {"projectId": projectId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (respone.statusCode == 200) {
        return BaseResponseModel.fromJson(
          respone.data,
          (data) => List<AppInfoModel>.from(
            data.map(
              (x) => AppInfoModel.fromJson(x),
            ),
          ),
        );
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      bool containsTokenExpiredError = e.response?.data['errors'].any((item) => item["name"] == "TokenExpiredError");
      if (containsTokenExpiredError) {
        throw const TokenExpiredException("Token Expired, Please Login Again");
      } else {
        throw ServerFailure(e.response?.data['errors']);
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<BaseResponseModel<AppInfoModel>> create({
    required String? token,
    required String? projectId,
    String? name,
    String? version,
    String? telegram,
    String? whatsapp,
    String? email,
    XFile? thumbnail,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "projectId": projectId,
        "name": name,
        "version": version,
        "telegram": telegram,
        "whatsapp": whatsapp,
        "email": email,
        "thumbnail": thumbnail != null ? await MultipartFile.fromFile(thumbnail.path) : "",
      });
      final respone = await _dio.post(
        ConfigApi.appinfo,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (respone.statusCode == 201) {
        log('sukses $respone');
        return BaseResponseModel.fromJson(respone.data, (data) => AppInfoModel.fromJson(data));
      } else {
        log('gagal $respone');
        throw ServerException();
      }
    } on DioException catch (e) {
      log('dio exeption $e');
      bool containsTokenExpiredError = e.response?.data['errors'].any((item) => item["name"] == "TokenExpiredError");
      if (containsTokenExpiredError) {
        throw const TokenExpiredException("Token Expired, Please Login Again");
      } else {
        log('server failure $e');
        throw ServerFailure(e.response?.data['errors']);
      }
    } catch (e) {
      log('cathc  $e');
      throw ServerException();
    }
  }

  @override
  Future<BaseResponseModel<AppInfoModel>> delete(
      {required String token, required String appinfoId, required String projectId}) async {
    try {
      final respone = await _dio.delete(
        ConfigApi.appinfo,
        data: {"appinfoId": appinfoId},
        queryParameters: {"projectId": projectId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (respone.statusCode == 200) {
        log('sukses $respone');
        return BaseResponseModel.fromJson(respone.data, (data) => AppInfoModel.fromJson(data));
      } else {
        log('gagal $respone');
        throw ServerException();
      }
    } on DioException catch (e) {
      bool containsTokenExpiredError = e.response?.data['errors'].any((item) => item["name"] == "TokenExpiredError");
      if (containsTokenExpiredError) {
        throw const TokenExpiredException("Token Expired, Please Login Again");
      } else {
        log("Request URL: ${e.requestOptions.uri}");
        log("Status Code: ${e.response?.statusCode}");
        log("Response Body: ${e.response?.data}");
        throw ServerFailure(e.response?.data['errors']);
      }
    } catch (e) {
      log('cathc  $e');
      throw ServerException();
    }
  }
}
