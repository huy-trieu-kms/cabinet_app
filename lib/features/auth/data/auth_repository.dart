import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/mock_data.dart';
import '../../../core/network/dio_provider.dart';
import '../../../core/network/exceptions.dart';

class AuthRepository {
  AuthRepository(this._ref);
  final Ref _ref;

  Future<String> login(String email, String password) async {
    final dio = _ref.read(dioProvider);
    try {
      // TODO: Replace this mock logic with real API call using Dio
      // final resp = await dio.post(
      //   '/auth/login',
      //   data: {'email': email, 'password': password},
      // );
      // Adjust according to your API's shape
      // final token = resp.data['accessToken'] as String?;
      // if (token == null) {
      //   throw ApiException('Token missing', statusCode: resp.statusCode);
      // }
      //return token;
      if (email.isNotEmpty && password.isNotEmpty) {
        return mockLoginResponse['accessToken'] as String;
      }
      throw ApiException('Invalid email or password');
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      final msg =
          e.response?.data is Map && (e.response?.data['message'] != null)
          ? e.response?.data['message'].toString()
          : e.message ?? 'Network error';
      throw ApiException(msg!, statusCode: code);
    }
  }
}
