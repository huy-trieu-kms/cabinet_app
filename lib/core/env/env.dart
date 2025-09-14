import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static late final String apiBaseUrl;
  static late final bool httpLogging;

  static Future<void> load() async {
    await dotenv.load(fileName: '.env');
    apiBaseUrl = dotenv.get('API_BASE_URL');
    httpLogging =
        (dotenv.get('HTTP_LOGGING', fallback: 'false').toLowerCase() == 'true');
  }
}
