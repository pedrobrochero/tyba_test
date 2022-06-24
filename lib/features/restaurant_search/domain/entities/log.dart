import 'package:freezed_annotation/freezed_annotation.dart';

part 'log.freezed.dart';

@freezed
class Log with _$Log {
  const factory Log({
    required DateTime createdAt,
    required String content,
  }) = _Log;
}
