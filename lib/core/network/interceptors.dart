import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/providers/auth_providers.dart';
import '../env/env.dart';
import '../logging/logging.dart';

class AuthTokenInterceptor extends Interceptor {
  final Ref ref;
  AuthTokenInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = ref.read(authControllerProvider).token;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    final devToken = dotenv.env['X_NEXTFORM_DEV_TOKEN'];
    if (devToken != null && devToken.isNotEmpty) {
      options.headers['X-NEXTFORM-DEV-TOKEN'] = devToken;
    }
    return handler.next(options);
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!Env.httpLogging) return handler.next(options);
    logger.info('➡️ ${options.method} ${options.uri}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!Env.httpLogging) return handler.next(response);
    logger.info('✅ ${response.statusCode} ${response.requestOptions.uri}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!Env.httpLogging) return handler.next(err);
    logger.severe(
      '❌ ${err.response?.statusCode} ${err.requestOptions.uri} — ${err.message}',
    );
    return handler.next(err);
  }
}
