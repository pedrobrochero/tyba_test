import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../entities/log.dart';

abstract class LoggerRepository {
  Future<Either<Failure, void>> createLog(Log log);
  Future<Either<Failure, List<Log>>> getLogs();
}
