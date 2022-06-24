import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleSignInProvider {
  Future<GoogleSignInAuthentication?> logIn();
  Future<void> logOut();
}

class GoogleSignInProviderImpl implements GoogleSignInProvider {
  final _google = GoogleSignIn();

  @override
  Future<GoogleSignInAuthentication?> logIn() async {
    final signIn = await _google.signIn();
    final auth = await signIn?.authentication;
    return auth;
  }

  @override
  Future<void> logOut() => _google.signOut();
}
