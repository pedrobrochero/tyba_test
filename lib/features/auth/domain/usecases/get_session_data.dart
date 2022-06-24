import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetSessionData extends UseCase<User, NoParams> {
  GetSessionData(this._authRepository);
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, User>> call(NoParams params) =>
      _authRepository.getSessionData();
}
