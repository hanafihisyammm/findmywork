import 'package:dartz/dartz.dart';
import 'package:find_my_work/domain/core/value_object.dart';
import 'package:find_my_work/domain/core/value_validators.dart';
import 'package:find_my_work/domain/core/failures.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}

class Description extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory Description(String input) {
    assert(input != null);
    return Description._(validateMaxStringLength(input, maxLength)
        .flatMap(validateStringIsNotEmpty));
  }

  const Description._(this.value);
}

class CommonField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CommonField(String input) {
    assert(input != null);
    return CommonField._(validateStringIsNotEmpty(input));
  }

  const CommonField._(this.value);
}
