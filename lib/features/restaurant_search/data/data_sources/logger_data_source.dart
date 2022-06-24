import '../../../../core/providers/sqlite_provider.dart';
import '../../domain/entities/log.dart';
import '../models/log_model.dart';

abstract class LoggerDataSource {
  Future<void> createLog(Log log);
  Future<List<Log>> getLogs();
}

class LoggerDataSourceImpl implements LoggerDataSource {
  LoggerDataSourceImpl(this.sqlite);

  final SqliteProvider sqlite;

  @override
  Future<void> createLog(Log log) async {
    final model = LogModel.fromEntity(log);
    await sqlite.insert(sqlite.logsTable, model.toJson());
  }

  @override
  Future<List<Log>> getLogs() async {
    final oneTimeTasks = await sqlite.query(
      sqlite.logsTable,
      orderBy: 'created_at desc',
    );
    return oneTimeTasks.map((e) => LogModel.fromJson(e).entity).toList();
  }
}
