// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shotpage_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShotPageData _$ShotPageDataFromJson(Map<String, dynamic> json) {
  return _ShotPageData.fromJson(json);
}

/// @nodoc
mixin _$ShotPageData {
  String get img => throw _privateConstructorUsedError;
  List<dynamic> get imgList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShotPageDataCopyWith<ShotPageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShotPageDataCopyWith<$Res> {
  factory $ShotPageDataCopyWith(
          ShotPageData value, $Res Function(ShotPageData) then) =
      _$ShotPageDataCopyWithImpl<$Res>;
  $Res call({String img, List<dynamic> imgList});
}

/// @nodoc
class _$ShotPageDataCopyWithImpl<$Res> implements $ShotPageDataCopyWith<$Res> {
  _$ShotPageDataCopyWithImpl(this._value, this._then);

  final ShotPageData _value;
  // ignore: unused_field
  final $Res Function(ShotPageData) _then;

  @override
  $Res call({
    Object? img = freezed,
    Object? imgList = freezed,
  }) {
    return _then(_value.copyWith(
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      imgList: imgList == freezed
          ? _value.imgList
          : imgList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_ShotPageDataCopyWith<$Res>
    implements $ShotPageDataCopyWith<$Res> {
  factory _$$_ShotPageDataCopyWith(
          _$_ShotPageData value, $Res Function(_$_ShotPageData) then) =
      __$$_ShotPageDataCopyWithImpl<$Res>;
  @override
  $Res call({String img, List<dynamic> imgList});
}

/// @nodoc
class __$$_ShotPageDataCopyWithImpl<$Res>
    extends _$ShotPageDataCopyWithImpl<$Res>
    implements _$$_ShotPageDataCopyWith<$Res> {
  __$$_ShotPageDataCopyWithImpl(
      _$_ShotPageData _value, $Res Function(_$_ShotPageData) _then)
      : super(_value, (v) => _then(v as _$_ShotPageData));

  @override
  _$_ShotPageData get _value => super._value as _$_ShotPageData;

  @override
  $Res call({
    Object? img = freezed,
    Object? imgList = freezed,
  }) {
    return _then(_$_ShotPageData(
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      imgList: imgList == freezed
          ? _value._imgList
          : imgList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShotPageData extends _ShotPageData {
  const _$_ShotPageData({this.img = '', final List<dynamic> imgList = const []})
      : _imgList = imgList,
        super._();

  factory _$_ShotPageData.fromJson(Map<String, dynamic> json) =>
      _$$_ShotPageDataFromJson(json);

  @override
  @JsonKey()
  final String img;
  final List<dynamic> _imgList;
  @override
  @JsonKey()
  List<dynamic> get imgList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgList);
  }

  @override
  String toString() {
    return 'ShotPageData(img: $img, imgList: $imgList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShotPageData &&
            const DeepCollectionEquality().equals(other.img, img) &&
            const DeepCollectionEquality().equals(other._imgList, _imgList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(img),
      const DeepCollectionEquality().hash(_imgList));

  @JsonKey(ignore: true)
  @override
  _$$_ShotPageDataCopyWith<_$_ShotPageData> get copyWith =>
      __$$_ShotPageDataCopyWithImpl<_$_ShotPageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShotPageDataToJson(
      this,
    );
  }
}

abstract class _ShotPageData extends ShotPageData {
  const factory _ShotPageData({final String img, final List<dynamic> imgList}) =
      _$_ShotPageData;
  const _ShotPageData._() : super._();

  factory _ShotPageData.fromJson(Map<String, dynamic> json) =
      _$_ShotPageData.fromJson;

  @override
  String get img;
  @override
  List<dynamic> get imgList;
  @override
  @JsonKey(ignore: true)
  _$$_ShotPageDataCopyWith<_$_ShotPageData> get copyWith =>
      throw _privateConstructorUsedError;
}
