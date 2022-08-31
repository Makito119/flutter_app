// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signup_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpData _$SignUpDataFromJson(Map<String, dynamic> json) {
  return _SignUpData.fromJson(json);
}

/// @nodoc
mixin _$SignUpData {
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get processing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpDataCopyWith<SignUpData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpDataCopyWith<$Res> {
  factory $SignUpDataCopyWith(
          SignUpData value, $Res Function(SignUpData) then) =
      _$SignUpDataCopyWithImpl<$Res>;
  $Res call({String email, String name, String password, bool processing});
}

/// @nodoc
class _$SignUpDataCopyWithImpl<$Res> implements $SignUpDataCopyWith<$Res> {
  _$SignUpDataCopyWithImpl(this._value, this._then);

  final SignUpData _value;
  // ignore: unused_field
  final $Res Function(SignUpData) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? password = freezed,
    Object? processing = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      processing: processing == freezed
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SignUpDataCopyWith<$Res>
    implements $SignUpDataCopyWith<$Res> {
  factory _$$_SignUpDataCopyWith(
          _$_SignUpData value, $Res Function(_$_SignUpData) then) =
      __$$_SignUpDataCopyWithImpl<$Res>;
  @override
  $Res call({String email, String name, String password, bool processing});
}

/// @nodoc
class __$$_SignUpDataCopyWithImpl<$Res> extends _$SignUpDataCopyWithImpl<$Res>
    implements _$$_SignUpDataCopyWith<$Res> {
  __$$_SignUpDataCopyWithImpl(
      _$_SignUpData _value, $Res Function(_$_SignUpData) _then)
      : super(_value, (v) => _then(v as _$_SignUpData));

  @override
  _$_SignUpData get _value => super._value as _$_SignUpData;

  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? password = freezed,
    Object? processing = freezed,
  }) {
    return _then(_$_SignUpData(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      processing: processing == freezed
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpData implements _SignUpData {
  const _$_SignUpData(
      {required this.email,
      required this.name,
      required this.password,
      required this.processing});

  factory _$_SignUpData.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpDataFromJson(json);

  @override
  final String email;
  @override
  final String name;
  @override
  final String password;
  @override
  final bool processing;

  @override
  String toString() {
    return 'SignUpData(email: $email, name: $name, password: $password, processing: $processing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpData &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.processing, processing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(processing));

  @JsonKey(ignore: true)
  @override
  _$$_SignUpDataCopyWith<_$_SignUpData> get copyWith =>
      __$$_SignUpDataCopyWithImpl<_$_SignUpData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpDataToJson(
      this,
    );
  }
}

abstract class _SignUpData implements SignUpData {
  const factory _SignUpData(
      {required final String email,
      required final String name,
      required final String password,
      required final bool processing}) = _$_SignUpData;

  factory _SignUpData.fromJson(Map<String, dynamic> json) =
      _$_SignUpData.fromJson;

  @override
  String get email;
  @override
  String get name;
  @override
  String get password;
  @override
  bool get processing;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpDataCopyWith<_$_SignUpData> get copyWith =>
      throw _privateConstructorUsedError;
}
