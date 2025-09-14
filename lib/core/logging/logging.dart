import 'package:logging/logging.dart';

final Logger logger = Logger('CabinetApp');

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    logger.log(
      record.level,
      '${record.time}: ${record.loggerName}: ${record.message}',
    );
  });
}
