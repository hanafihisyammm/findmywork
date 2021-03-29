import 'dart:ui';

import 'package:find_my_work/domain/core/failures.dart';
import 'package:find_my_work/domain/core/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:find_my_work/domain/core/value_transformers.dart';
import 'package:find_my_work/domain/core/value_validators.dart';
import 'package:kt_dart/collection.dart';

class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory NoteBody(String input) {
    return NoteBody._(validateMaxStringLength(input, maxLength)
        .flatMap(validateStringIsNotEmpty));
  }

  const NoteBody._(this.value);
}

class TodoName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory TodoName(String input) {
    return TodoName._(validateMaxStringLength(input, maxLength)
        .flatMap(validateStringIsNotEmpty)
        .flatMap(validateSingleLine));
  }

  const TodoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;

  factory NoteColor(Color input) {
    assert(input != null);
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}

class ListThree<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 3;

  factory ListThree(KtList<T> input) {
    return ListThree._(validateMaxListLength(input, maxLength));
  }

  const ListThree._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}
