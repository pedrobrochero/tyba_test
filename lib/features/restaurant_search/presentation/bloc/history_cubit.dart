import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/control_classes/status.dart';
import '../../../../core/control_classes/usecase.dart';
import '../../domain/entities/log.dart';
import '../../domain/usecases/get_logs.dart';

part 'history_cubit.freezed.dart';
part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this._getLogsUsecase) : super(const HistoryState()) {
    getInitialData();
  }
  final GetLogs _getLogsUsecase;
  void getInitialData() async {
    emit(state.copyWith(status: const Status.loading()));
    final logsEither = await _getLogsUsecase.call(NoParams());
    logsEither.fold(
      (l) => emit(state.copyWith(status: const Status.error())),
      (r) => emit(state.copyWith(
        status: const Status.loaded(),
        logs: r,
      )),
    );
  }
}
