// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call(
      {String message = '',
      String senderId = '',
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
          DateTime? createdAt,
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
          DateTime? updatedAt}) {
    return _Message(
      message: message,
      senderId: senderId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Message fromJson(Map<String, Object> json) {
    return Message.fromJson(json);
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  String get message => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call(
      {String message,
      String senderId,
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime) DateTime? createdAt,
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime) DateTime? updatedAt});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? senderId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      String senderId,
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime) DateTime? createdAt,
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime) DateTime? updatedAt});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? message = freezed,
    Object? senderId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Message(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Message with DiagnosticableTreeMixin implements _Message {
  const _$_Message(
      {this.message = '',
      this.senderId = '',
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime) this.createdAt,
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime) this.updatedAt});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String message;
  @JsonKey(defaultValue: '')
  @override
  final String senderId;
  @override
  @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
  final DateTime? createdAt;
  @override
  @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Message(message: $message, senderId: $senderId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Message'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('senderId', senderId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Message &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.senderId, senderId) ||
                const DeepCollectionEquality()
                    .equals(other.senderId, senderId)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(senderId) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {String message,
      String senderId,
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
          DateTime? createdAt,
      @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
          DateTime? updatedAt}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get senderId => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: toTimestamp, fromJson: toDateTime)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
