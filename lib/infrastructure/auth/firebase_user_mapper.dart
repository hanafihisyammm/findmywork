import 'package:find_my_work/domain/auth/user.dart';
import 'package:find_my_work/domain/core/value_object.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

extension UserDomainX on firebase.User {
  CurrentUser toDomain() {
    return CurrentUser(id: UniqueId.fromUniqueString(uid));
  }
}
