// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'homepage_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomePageData _$HomePageDataFromJson(Map<String, dynamic> json) {
  return _HomePageData.fromJson(json);
}

/// @nodoc
mixin _$HomePageData {
  bool get hideNavigation => throw _privateConstructorUsedError;
  bool get showNavigation => throw _privateConstructorUsedError;
  int get bottomNaviChange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageDataCopyWith<HomePageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageDataCopyWith<$Res> {
  factory $HomePageDataCopyWith(
          HomePageData value, $Res Function(HomePageData) then) =
      _$HomePageDataCopyWithImpl<$Res>;
  $Res call({bool hideNavigation, bool showNavigation, int bottomNaviChange});
}

/// @nodoc
class _$HomePageDataCopyWithImpl<$Res> implements $HomePageDataCopyWith<$Res> {
  _$HomePageDataCopyWithImpl(this._value, this._then);

  final HomePageData _value;
  // ignore: unused_field
  final $Res Function(HomePageData) _then;

  @override
  $Res call({
    Object? hideNavigation = freezed,
    Object? showNavigation = freezed,
    Object? bottomNaviChange = freezed,
  }) {
    return _then(_value.copyWith(
      hideNavigation: hideNavigation == freezed
          ? _value.hideNavigation
          : hideNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      showNavigation: showNavigation == freezed
          ? _value.showNavigation
          : showNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      bottomNaviChange: bottomNaviChange == freezed
          ? _value.bottomNaviChange
          : bottomNaviChange // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_HomePageDataCopyWith<$Res>
    implements $HomePageDataCopyWith<$Res> {
  factory _$$_HomePageDataCopyWith(
          _$_HomePageData value, $Res Function(_$_HomePageData) then) =
      __$$_HomePageDataCopyWithImpl<$Res>;
  @override
  $Res call({bool hideNavigation, bool showNavigation, int bottomNaviChange});
}

/// @nodoc
class __$$_HomePageDataCopyWithImpl<$Res>
    extends _$HomePageDataCopyWithImpl<$Res>
    implements _$$_HomePageDataCopyWith<$Res> {
  __$$_HomePageDataCopyWithImpl(
      _$_HomePageData _value, $Res Function(_$_HomePageData) _then)
      : super(_value, (v) => _then(v as _$_HomePageData));

  @override
  _$_HomePageData get _value => super._value as _$_HomePageData;

  @override
  $Res call({
    Object? hideNavigation = freezed,
    Object? showNavigation = freezed,
    Object? bottomNaviChange = freezed,
  }) {
    return _then(_$_HomePageData(
      hideNavigation: hideNavigation == freezed
          ? _value.hideNavigation
          : hideNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      showNavigation: showNavigation == freezed
          ? _value.showNavigation
          : showNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      bottomNaviChange: bottomNaviChange == freezed
          ? _value.bottomNaviChange
          : bottomNaviChange // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomePageData implements _HomePageData {
  const _$_HomePageData(
      {required this.hideNavigation,
      required this.showNavigation,
      required this.bottomNaviChange});

  factory _$_HomePageData.fromJson(Map<String, dynamic> json) =>
      _$$_HomePageDataFromJson(json);

  @override
  final bool hideNavigation;
  @override
  final bool showNavigation;
  @override
  final int bottomNaviChange;

  @override
  String toString() {
    return 'HomePageData(hideNavigation: $hideNavigation, showNavigation: $showNavigation, bottomNaviChange: $bottomNaviChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageData &&
            const DeepCollectionEquality()
                .equals(other.hideNavigation, hideNavigation) &&
            const DeepCollectionEquality()
                .equals(other.showNavigation, showNavigation) &&
            const DeepCollectionEquality()
                .equals(other.bottomNaviChange, bottomNaviChange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hideNavigation),
      const DeepCollectionEquality().hash(showNavigation),
      const DeepCollectionEquality().hash(bottomNaviChange));

  @JsonKey(ignore: true)
  @override
  _$$_HomePageDataCopyWith<_$_HomePageData> get copyWith =>
      __$$_HomePageDataCopyWithImpl<_$_HomePageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomePageDataToJson(
      this,
    );
  }
}

abstract class _HomePageData implements HomePageData {
  const factory _HomePageData(
      {required final bool hideNavigation,
      required final bool showNavigation,
      required final int bottomNaviChange}) = _$_HomePageData;

  factory _HomePageData.fromJson(Map<String, dynamic> json) =
      _$_HomePageData.fromJson;

  @override
  bool get hideNavigation;
  @override
  bool get showNavigation;
  @override
  int get bottomNaviChange;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageDataCopyWith<_$_HomePageData> get copyWith =>
      throw _privateConstructorUsedError;
}
