import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../entities/log.dart';
import '../repositories/logger_repository.dart';

class GetLogs extends UseCase<List<Log>, NoParams> {
  GetLogs(this._repository);

  final LoggerRepository _repository;
  @override
  Future<Either<Failure, List<Log>>> call(NoParams params) =>
      _repository.getLogs();
}
