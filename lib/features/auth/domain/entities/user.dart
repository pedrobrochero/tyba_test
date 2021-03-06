import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    String? displayName,
    String? email,
    String? photoUrl,
  }) = _User;
}
