import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/failures.dart';

abstract class FirebaseAuthProvider {
  Future<FirebaseUserData?> getuserData();
  Future<FirebaseUserData> signInWithProvider(
      String? accessToken, String? idToken);
  Future<void> logout();
}

class FirebaseAuthProviderImpl implements FirebaseAuthProvider {
  @override
  Future<FirebaseUserData?> getuserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    return FirebaseUserData(
      token: await user.getIdToken(),
      uid: user.uid,
      displayName: user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
    );
  }

  @override
  Future<FirebaseUserData> signInWithProvider(
      String? accessToken, String? idToken) async {
    final providerCredential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: idToken,
    );
    final firebaseCredential =
        await FirebaseAuth.instance.signInWithCredential(providerCredential);
    final user = firebaseCredential.user;

    if (user == null) {
      throw UnreachableUserDataFailure();
    }
    return FirebaseUserData(
      token: await user.getIdToken(),
      uid: user.uid,
      displayName: user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
    );
  }

  @override
  Future<void> logout() => FirebaseAuth.instance.signOut();
}

class FirebaseUserData {
  FirebaseUserData({
    required this.token,
    required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
  });
  final String uid;
  final String token;
  final String? email;
  final String? photoUrl;
  final String? displayName;
}
