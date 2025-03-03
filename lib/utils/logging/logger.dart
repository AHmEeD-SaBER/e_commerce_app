import 'package:logger/logger.dart';

class LoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );

  static void logDebug(String message) {
    _logger.d(message);
  }

  static void logInfo(String message) {
    _logger.i(message);
  }

  static void logWarning(String message) {
    _logger.w(message);
  }

  static void logError(dynamic message) {
    _logger.e(message, error: message, stackTrace: StackTrace.current);
  }
}
