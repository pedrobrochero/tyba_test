import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> getSessionData();
  Future<Either<Failure, User>> loginWGoogle();
  Future<Either<Failure, void>> logout();
}
