import 'package:logging/logging.dart';

final Logger appLogger = Logger('CabinetApp');

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    appLogger.log(
      record.level,
      '${record.time}: ${record.loggerName}: ${record.message}',
    );
  });
}
