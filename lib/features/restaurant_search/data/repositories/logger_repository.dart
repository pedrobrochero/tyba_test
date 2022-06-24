import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../domain/entities/failures.dart';
import '../../domain/entities/log.dart';
import '../../domain/repositories/logger_repository.dart';
import '../data_sources/logger_data_source.dart';

class LoggerRepositoryImpl implements LoggerRepository {
  LoggerRepositoryImpl(this._dataSource);

  final LoggerDataSource _dataSource;
  @override
  Future<Either<Failure, void>> createLog(Log log) async {
    try {
      await _dataSource.createLog(log);
      return const Right(null);
    } catch (e) {
      return Left(LoggerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Log>>> getLogs() async {
    try {
      final logs = await _dataSource.getLogs();
      return Right(logs);
    } catch (e) {
      return Left(LoggerFailure());
    }
  }
}
