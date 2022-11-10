import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(methodCount: 0, lineLength: 60, printEmojis: true, stackTraceBeginIndex: 0));
