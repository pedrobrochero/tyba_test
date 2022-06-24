import '../../control_classes/exception.dart';

mixin HttpHelpers {
  Map<String, dynamic> getHeaders([String? token]) {
    final map = <String, dynamic>{};
    if (token != null) {
      map['x-token'] = token;
    }
    return map;
  }

  T getEntity<T>(Map<String, dynamic> data,
      T Function(Map<String, dynamic>) decodeFunction) {
    try {
      final entity = decodeFunction(data);
      return entity;
    } catch (e) {
      throw ParsingException();
    }
  }

  List<T> getList<T>(
      List data, T Function(Map<String, dynamic>) decodeFunction) {
    try {
      final list = data.map((e) => decodeFunction(e)).toList();
      return list;
    } catch (e) {
      throw ParsingException();
    }
  }
}
