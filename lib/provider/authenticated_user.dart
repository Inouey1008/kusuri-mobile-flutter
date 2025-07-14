import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authenticated_user.g.dart';

@Riverpod(keepAlive: true)
class AuthenticatedUser extends _$AuthenticatedUser {
  @override
  FutureOr<User?> build() async {
    FirebaseAuth.instance.userChanges().listen((user) {
      Logger().d("FirebaseAuth.instance.userChanges()");

      if (user == null) {
        signInAnonymously();
      }
    });
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> signInAnonymously() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await FirebaseAuth.instance.signInAnonymously();
      await FirebaseAuth.instance.currentUser?.reload();
      return FirebaseAuth.instance.currentUser;
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await FirebaseAuth.instance.signOut();
      await FirebaseAuth.instance.currentUser?.reload();
      return FirebaseAuth.instance.currentUser;
    });
  }
}
