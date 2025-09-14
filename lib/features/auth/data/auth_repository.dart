import 'package:cabinet_app/core/models/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_path.dart';
import '../../../core/exceptions/api_exception.dart';
import '../../../core/models/error_response.dart';
import '../../../core/network/dio_provider.dart';
import '../../../features/auth/data/auth_model.dart';

class AuthRepository {
  AuthRepository(this._ref);
  final Ref _ref;

  Future<LoginResponse> login(String email, String password) async {
    final dio = _ref.read(dioProvider);

    try {
      final response = await dio.post(
        AppPath.login,
        data: LoginRequest(username: email, password: password).toJson(),
      );

      // Parse the response to ApiResponse<LoginResponse>
      final apiResponse = ApiResponse<LoginResponse>.fromJson(
        response.data as Map<String, dynamic>,
        (obj) => LoginResponse.fromJson(obj as Map<String, dynamic>),
      );

      if (apiResponse.isSuccessful != true || apiResponse.resultObj == null) {
        throw ApiException(
          !apiResponse.isSuccessful ? 'Login failed' : 'Unknown error',
          statusCode: response.statusCode,
        );
      }

      return apiResponse.resultObj!;
    } on DioException catch (e) {
      final code = e.response?.statusCode;

      if (e.response?.data is Map<String, dynamic>) {
        try {
          final error = ErrorResponse.fromJson(
            e.response!.data as Map<String, dynamic>,
          );

          throw ApiException(
            error.message,
            statusCode: code,
            validationErrors: error.validationErrors, // ✅ forward it
          );
        } catch (_) {
          // fallback if parsing fails
          throw ApiException(
            e.response?.data['message']?.toString() ?? 'Unknown API error',
            statusCode: code,
          );
        }
      }

      throw ApiException(e.message ?? 'Network error', statusCode: code);
    }
  }
}
