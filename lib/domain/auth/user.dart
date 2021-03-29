import 'package:find_my_work/domain/core/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    required UniqueId id,
  }) = _CurrentUser;
}
