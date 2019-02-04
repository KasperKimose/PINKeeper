import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_keeper/repository/user_entity.dart';
import 'package:pin_keeper/repository/user_repository.dart';

class FirebaseUserRepository implements UserRepository {

  final FirebaseAuth auth;

  const FirebaseUserRepository(this.auth);

  @override
  Future<UserEntity> login() async {
    final firebaseUser = await auth.signInAnonymously();

    return UserEntity(
      id: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoUrl,
    );
  }

}