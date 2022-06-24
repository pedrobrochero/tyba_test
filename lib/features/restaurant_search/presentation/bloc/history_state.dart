part of 'history_cubit.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(Status.loading()) Status status,
    @Default([]) List<Log> logs,
  }) = _Initial;
}
