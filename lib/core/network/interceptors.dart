import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/providers/auth_providers.dart';
import '../env/env.dart';

class AuthTokenInterceptor extends Interceptor {
  final Ref ref;
  AuthTokenInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = ref.read(authControllerProvider).token;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!Env.httpLogging || kReleaseMode) return handler.next(options);
    // Keep logs terse; tune to your needs
    // ignore: avoid_print
    print('➡️ ${options.method} ${options.uri}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!Env.httpLogging || kReleaseMode) return handler.next(response);
    // ignore: avoid_print
    print('✅ ${response.statusCode} ${response.requestOptions.uri}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!Env.httpLogging || kReleaseMode) return handler.next(err);
    // ignore: avoid_print
    print(
      '❌ ${err.response?.statusCode} ${err.requestOptions.uri} — ${err.message}',
    );
    return handler.next(err);
  }
}
