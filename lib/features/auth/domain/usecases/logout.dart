import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../repositories/auth_repository.dart';

class Logout extends UseCase<void, NoParams> {
  Logout(this._authRepository);
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) =>
      _authRepository.logout();
}
