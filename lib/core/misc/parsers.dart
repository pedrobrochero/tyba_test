// ignore_for_file: avoid_positional_boolean_parameters

//! DateTime
DateTime dateTimeFromMillis(int value) =>
    DateTime.fromMillisecondsSinceEpoch(value);

int dateTimeToMillis(DateTime value) => value.millisecondsSinceEpoch;

DateTime? dateTimeFromMillisOrNull(int? value) =>
    value == null ? null : DateTime.fromMillisecondsSinceEpoch(value);

int? dateTimeToMillisOrNull(DateTime? value) => value?.millisecondsSinceEpoch;
//! bool
bool boolFromInt(int value) => value == 1;
int boolToInt(bool value) => value ? 1 : 0;
