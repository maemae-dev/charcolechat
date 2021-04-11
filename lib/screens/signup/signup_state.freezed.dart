// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignupStateTearOff {
  const _$SignupStateTearOff();

  _SignupState call(
      {String email = '', String password = '', String name = ''}) {
    return _SignupState(
      email: email,
      password: password,
      name: name,
    );
  }
}

/// @nodoc
const $SignupState = _$SignupStateTearOff();

/// @nodoc
mixin _$SignupState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res>;
  $Res call({String email, String password, String name});
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res> implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  final SignupState _value;
  // ignore: unused_field
  final $Res Function(SignupState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignupStateCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(
          _SignupState value, $Res Function(_SignupState) then) =
      __$SignupStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password, String name});
}

/// @nodoc
class __$SignupStateCopyWithImpl<$Res> extends _$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(
      _SignupState _value, $Res Function(_SignupState) _then)
      : super(_value, (v) => _then(v as _SignupState));

  @override
  _SignupState get _value => super._value as _SignupState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
  }) {
    return _then(_SignupState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_SignupState with DiagnosticableTreeMixin implements _SignupState {
  const _$_SignupState({this.email = '', this.password = '', this.name = ''});

  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: '')
  @override
  final String password;
  @JsonKey(defaultValue: '')
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignupState(email: $email, password: $password, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignupState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignupState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$SignupStateCopyWith<_SignupState> get copyWith =>
      __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);
}

abstract class _SignupState implements SignupState {
  const factory _SignupState({String email, String password, String name}) =
      _$_SignupState;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignupStateCopyWith<_SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}
