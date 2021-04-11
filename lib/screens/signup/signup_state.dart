import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_state.freezed.dart';

@freezed
abstract class SignupState with _$SignupState {
  const factory SignupState({
    @Default('') String email,
    @Default('') String password,
    @Default('') String name,
  }) = _SignupState;
}
