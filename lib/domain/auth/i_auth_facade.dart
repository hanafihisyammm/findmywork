import 'package:find_my_work/domain/auth/user.dart';
import 'package:find_my_work/domain/auth/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  Future<Option<CurrentUser>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
