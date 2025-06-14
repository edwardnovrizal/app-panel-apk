import 'package:dio/dio.dart';
import 'package:panel_apk/src/data/models/login_model.dart';
import 'package:panel_apk/src/data/models/register_model.dart';

import '../../../commons/exeption.dart';
import '../../../commons/failure.dart';
import '../../../config/api_config.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponeModel> register(String username, String email, String fullname, String password);
  Future<LoginResponeModel> login(String username, String password);
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  Dio get _dio => Dio(BaseOptions(
        sendTimeout: const Duration(milliseconds: 6000),
        contentType: 'application/json',
        baseUrl: ConfigApi.baseAuth,
      ));

  @override
  Future<RegisterResponeModel> register(String username, String email, String fullname, String password) async {
    try {
      final respone = await _dio.post(ConfigApi.register, data: {
        'username': username,
        'email': email,
        'fullname': fullname,
        'password': password,
      });

      if (respone.statusCode == 201) {
        return RegisterResponeModel.fromJson(respone.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw ServerFailure(e.response?.data['errors']);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<LoginResponeModel> login(String username, String password) async {
    try {
      final respone = await _dio.post(ConfigApi.login, data: {
        'email': username,
        'password': password,
      });

      if (respone.statusCode == 200) {
        return LoginResponeModel.fromJson(respone.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw ServerFailure(e.response?.data['message']);
    } catch (e) {
      throw ServerException();
    }
  }
}
