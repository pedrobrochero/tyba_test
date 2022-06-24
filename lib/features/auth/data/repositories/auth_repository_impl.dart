import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../domain/entities/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/firebase_auth_provider.dart';
import '../datasources/google_sign_in_provider.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._firebaseAuthProvider,
    this._googleSignInProvider,
  );
  final FirebaseAuthProvider _firebaseAuthProvider;
  final GoogleSignInProvider _googleSignInProvider;

  @override
  Future<Either<Failure, User>> getSessionData() async {
    final firebaseUserData = await _firebaseAuthProvider.getuserData();
    if (firebaseUserData == null) {
      return Left(NotLoggedFailure());
    }
    return Right(_userFromFirebaseData(firebaseUserData));
  }

  @override
  Future<Either<Failure, User>> loginWGoogle() async {
    try {
      final credentials = await _googleSignInProvider.logIn();
      if (credentials == null) {
        return Left(LoginAbortedByUserFailure());
      }
      final firebaseUserData = await _firebaseAuthProvider.signInWithProvider(
          credentials.accessToken, credentials.idToken);

      return Right(_userFromFirebaseData(firebaseUserData));
    } catch (e) {
      print(e);
      return Left(UnknownFailure());
    }
  }

  User _userFromFirebaseData(FirebaseUserData firebaseUserData) => User(
        displayName: firebaseUserData.displayName,
        email: firebaseUserData.displayName,
        photoUrl: firebaseUserData.photoUrl,
      );

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await Future.wait([
        _firebaseAuthProvider.logout(),
        _googleSignInProvider.logOut(),
      ]);
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
