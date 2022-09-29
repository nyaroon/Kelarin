import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PMTestAppsFirebaseUser {
  PMTestAppsFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PMTestAppsFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PMTestAppsFirebaseUser> pMTestAppsFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PMTestAppsFirebaseUser>(
            (user) => currentUser = PMTestAppsFirebaseUser(user));
