import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/misc/parsers.dart';
import '../../domain/entities/log.dart';

part 'log_model.freezed.dart';
part 'log_model.g.dart';

@freezed
class LogModel with _$LogModel {
  const factory LogModel({
    @JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
        required DateTime createdAt,
    required String content,
  }) = _LogModel;

  factory LogModel.fromJson(Map<String, dynamic> json) =>
      _$LogModelFromJson(json);

  factory LogModel.fromEntity(Log log) => LogModel(
        createdAt: log.createdAt,
        content: log.content,
      );

  const LogModel._();

  Log get entity => Log(
        createdAt: createdAt,
        content: content,
      );
}
