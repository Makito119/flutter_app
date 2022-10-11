// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profilepage_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfilePageData _$ProfilePageDataFromJson(Map<String, dynamic> json) {
  return _ProfilePageData.fromJson(json);
}

/// @nodoc
mixin _$ProfilePageData {
  bool get showNavigation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfilePageDataCopyWith<ProfilePageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePageDataCopyWith<$Res> {
  factory $ProfilePageDataCopyWith(
          ProfilePageData value, $Res Function(ProfilePageData) then) =
      _$ProfilePageDataCopyWithImpl<$Res>;
  $Res call({bool showNavigation});
}

/// @nodoc
class _$ProfilePageDataCopyWithImpl<$Res>
    implements $ProfilePageDataCopyWith<$Res> {
  _$ProfilePageDataCopyWithImpl(this._value, this._then);

  final ProfilePageData _value;
  // ignore: unused_field
  final $Res Function(ProfilePageData) _then;

  @override
  $Res call({
    Object? showNavigation = freezed,
  }) {
    return _then(_value.copyWith(
      showNavigation: showNavigation == freezed
          ? _value.showNavigation
          : showNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ProfilePageDataCopyWith<$Res>
    implements $ProfilePageDataCopyWith<$Res> {
  factory _$$_ProfilePageDataCopyWith(
          _$_ProfilePageData value, $Res Function(_$_ProfilePageData) then) =
      __$$_ProfilePageDataCopyWithImpl<$Res>;
  @override
  $Res call({bool showNavigation});
}

/// @nodoc
class __$$_ProfilePageDataCopyWithImpl<$Res>
    extends _$ProfilePageDataCopyWithImpl<$Res>
    implements _$$_ProfilePageDataCopyWith<$Res> {
  __$$_ProfilePageDataCopyWithImpl(
      _$_ProfilePageData _value, $Res Function(_$_ProfilePageData) _then)
      : super(_value, (v) => _then(v as _$_ProfilePageData));

  @override
  _$_ProfilePageData get _value => super._value as _$_ProfilePageData;

  @override
  $Res call({
    Object? showNavigation = freezed,
  }) {
    return _then(_$_ProfilePageData(
      showNavigation: showNavigation == freezed
          ? _value.showNavigation
          : showNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfilePageData implements _ProfilePageData {
  const _$_ProfilePageData({required this.showNavigation});

  factory _$_ProfilePageData.fromJson(Map<String, dynamic> json) =>
      _$$_ProfilePageDataFromJson(json);

  @override
  final bool showNavigation;

  @override
  String toString() {
    return 'ProfilePageData(showNavigation: $showNavigation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfilePageData &&
            const DeepCollectionEquality()
                .equals(other.showNavigation, showNavigation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(showNavigation));

  @JsonKey(ignore: true)
  @override
  _$$_ProfilePageDataCopyWith<_$_ProfilePageData> get copyWith =>
      __$$_ProfilePageDataCopyWithImpl<_$_ProfilePageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfilePageDataToJson(
      this,
    );
  }
}

abstract class _ProfilePageData implements ProfilePageData {
  const factory _ProfilePageData({required final bool showNavigation}) =
      _$_ProfilePageData;

  factory _ProfilePageData.fromJson(Map<String, dynamic> json) =
      _$_ProfilePageData.fromJson;

  @override
  bool get showNavigation;
  @override
  @JsonKey(ignore: true)
  _$$_ProfilePageDataCopyWith<_$_ProfilePageData> get copyWith =>
      throw _privateConstructorUsedError;
}
