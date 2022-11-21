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

/// @nodoc
mixin _$SignUpData {
  String? get name => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get imag_url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpDataCopyWith<SignUpData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpDataCopyWith<$Res> {
  factory $SignUpDataCopyWith(
          SignUpData value, $Res Function(SignUpData) then) =
      _$SignUpDataCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      String? uid,
      String? phone,
      String? gender,
      String? imag_url});
}

/// @nodoc
class _$SignUpDataCopyWithImpl<$Res> implements $SignUpDataCopyWith<$Res> {
  _$SignUpDataCopyWithImpl(this._value, this._then);

  final SignUpData _value;
  // ignore: unused_field
  final $Res Function(SignUpData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? uid = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? imag_url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      imag_url: imag_url == freezed
          ? _value.imag_url
          : imag_url // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String? name,
      String? uid,
      String? phone,
      String? gender,
      String? imag_url});
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
    Object? name = freezed,
    Object? uid = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? imag_url = freezed,
  }) {
    return _then(_$_SignUpData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      imag_url: imag_url == freezed
          ? _value.imag_url
          : imag_url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SignUpData implements _SignUpData {
  const _$_SignUpData(
      {this.name = '',
      this.uid = '',
      this.phone = '',
      this.gender = '',
      this.imag_url = ''});

  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? uid;
  @override
  @JsonKey()
  final String? phone;
  @override
  @JsonKey()
  final String? gender;
  @override
  @JsonKey()
  final String? imag_url;

  @override
  String toString() {
    return 'SignUpData(name: $name, uid: $uid, phone: $phone, gender: $gender, imag_url: $imag_url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpData &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.imag_url, imag_url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(imag_url));

  @JsonKey(ignore: true)
  @override
  _$$_SignUpDataCopyWith<_$_SignUpData> get copyWith =>
      __$$_SignUpDataCopyWithImpl<_$_SignUpData>(this, _$identity);
}

abstract class _SignUpData implements SignUpData {
  const factory _SignUpData(
      {final String? name,
      final String? uid,
      final String? phone,
      final String? gender,
      final String? imag_url}) = _$_SignUpData;

  @override
  String? get name;
  @override
  String? get uid;
  @override
  String? get phone;
  @override
  String? get gender;
  @override
  String? get imag_url;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpDataCopyWith<_$_SignUpData> get copyWith =>
      throw _privateConstructorUsedError;
}
