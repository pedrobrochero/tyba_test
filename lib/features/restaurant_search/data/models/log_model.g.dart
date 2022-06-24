// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LogModel _$$_LogModelFromJson(Map<String, dynamic> json) => _$_LogModel(
      createdAt: dateTimeFromMillis(json['created_at'] as int),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_LogModelToJson(_$_LogModel instance) =>
    <String, dynamic>{
      'created_at': dateTimeToMillis(instance.createdAt),
      'content': instance.content,
    };
