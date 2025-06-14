import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/data/models/base_model.dart';
import 'package:panel_apk/src/data/models/project_model.dart';

import '../../../commons/exeption.dart';
import '../../../commons/failure.dart';
import '../../../config/api_config.dart';

abstract class ProjectRemoteDatasource {
  Future<BaseResponseModel<List<ProjectModel>>> readProject(String token);
  Future<BaseResponseModel<ProjectModel>> createProject({
    required String token,
    required String name,
    required String packageName,
    required String godevName,
    XFile? logo,
  });
  Future<BaseResponseModel<ProjectModel>> deleteProject({
    required String token,
    required String idProject,
  });
  Future<BaseResponseModel<ProjectModel>> updateProject({
    required String idProject,
    required String token,
    required String name,
    required String packageName,
    required String godevName,
    XFile? logo,
  });
}

class ProjectRemoteDatasourceImpl extends ProjectRemoteDatasource {
  Dio get _dio => Dio(BaseOptions(
        sendTimeout: const Duration(milliseconds: 6000),
        contentType: 'application/json',
        baseUrl: ConfigApi.baseAuth,
      ));

  @override
  Future<BaseResponseModel<List<ProjectModel>>> readProject(String token) async {
    try {
      final respone = await _dio.get(
        ConfigApi.project,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (respone.statusCode == 200) {
        return BaseResponseModel.fromJson(
          respone.data,
          (data) => List<ProjectModel>.from(
            data.map(
              (x) => ProjectModel.fromJson(x),
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
  Future<BaseResponseModel<ProjectModel>> createProject({
    required String token,
    required String name,
    required String packageName,
    required String godevName,
    XFile? logo,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "name": name,
        "packageName": packageName,
        "godevName": godevName,
        "logo": logo != null ? await MultipartFile.fromFile(logo.path) : "",
      });
      final respone = await _dio.post(
        ConfigApi.project,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      log("ini respone $respone");
      if (respone.statusCode == 201) {
        return BaseResponseModel.fromJson(respone.data, (data) => ProjectModel.fromJson(data));
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      log(" ini dio exeption $e");
      bool containsTokenExpiredError = e.response?.data['errors'].any((item) => item["name"] == "TokenExpiredError");
      if (containsTokenExpiredError) {
        throw const TokenExpiredException("Token Expired, Please Login Again");
      } else {
        throw ServerFailure(e.response?.data['errors']);
      }
    } catch (e) {
      log("ini catch $e");
      throw ServerException();
    }
  }

  @override
  Future<BaseResponseModel<ProjectModel>> deleteProject({required String token, required String idProject}) async {
    try {
      final respone = await _dio.delete(
        ConfigApi.project,
        data: {"projectId": idProject},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      log("ini respone $respone");
      if (respone.statusCode == 200) {
        return BaseResponseModel.fromJson(respone.data, (data) => ProjectModel.fromJson(data));
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      log("$e");
      bool containsTokenExpiredError = e.response?.data['errors'].any((item) => item["name"] == "TokenExpiredError");
      if (containsTokenExpiredError) {
        throw const TokenExpiredException("Token Expired, Please Login Again");
      } else {
        throw ServerFailure(e.response?.data['errors']);
      }
    } catch (e) {
      log("$e");
      throw ServerException();
    }
  }

  @override
  Future<BaseResponseModel<ProjectModel>> updateProject(
      {required String idProject,
      required String token,
      required String name,
      required String packageName,
      required String godevName,
      XFile? logo}) async {
    try {
      FormData data = FormData.fromMap({
        "projectId": idProject,
        "name": name,
        "packageName": packageName,
        "godevName": godevName,
        "logo": logo != null ? await MultipartFile.fromFile(logo.path) : "",
      });
      final respone = await _dio.put(
        ConfigApi.project,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      log("ini respone $respone");
      if (respone.statusCode == 200) {
        return BaseResponseModel.fromJson(respone.data, (data) => ProjectModel.fromJson(data));
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      log("$e");
      bool containsTokenExpiredError = e.response?.data['errors'].any((item) => item["name"] == "TokenExpiredError");
      if (containsTokenExpiredError) {
        throw const TokenExpiredException("Token Expired, Please Login Again");
      } else {
        throw ServerFailure(e.response?.data['errors']);
      }
    } catch (e) {
      log("$e");
      throw ServerException();
    }
  }
}
