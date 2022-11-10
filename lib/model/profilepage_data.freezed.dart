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

/// @nodoc
mixin _$ProfilePageData {
  bool get showNavigation => throw _privateConstructorUsedError;
  List<StoreListModel> get storeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfilePageDataCopyWith<ProfilePageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePageDataCopyWith<$Res> {
  factory $ProfilePageDataCopyWith(
          ProfilePageData value, $Res Function(ProfilePageData) then) =
      _$ProfilePageDataCopyWithImpl<$Res>;
  $Res call({bool showNavigation, List<StoreListModel> storeList});
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
    Object? storeList = freezed,
  }) {
    return _then(_value.copyWith(
      showNavigation: showNavigation == freezed
          ? _value.showNavigation
          : showNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      storeList: storeList == freezed
          ? _value.storeList
          : storeList // ignore: cast_nullable_to_non_nullable
              as List<StoreListModel>,
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
  $Res call({bool showNavigation, List<StoreListModel> storeList});
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
    Object? storeList = freezed,
  }) {
    return _then(_$_ProfilePageData(
      showNavigation: showNavigation == freezed
          ? _value.showNavigation
          : showNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      storeList: storeList == freezed
          ? _value._storeList
          : storeList // ignore: cast_nullable_to_non_nullable
              as List<StoreListModel>,
    ));
  }
}

/// @nodoc

class _$_ProfilePageData extends _ProfilePageData {
  const _$_ProfilePageData(
      {this.showNavigation = true,
      final List<StoreListModel> storeList = const <StoreListModel>[]})
      : _storeList = storeList,
        super._();

  @override
  @JsonKey()
  final bool showNavigation;
  final List<StoreListModel> _storeList;
  @override
  @JsonKey()
  List<StoreListModel> get storeList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeList);
  }

  @override
  String toString() {
    return 'ProfilePageData(showNavigation: $showNavigation, storeList: $storeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfilePageData &&
            const DeepCollectionEquality()
                .equals(other.showNavigation, showNavigation) &&
            const DeepCollectionEquality()
                .equals(other._storeList, _storeList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showNavigation),
      const DeepCollectionEquality().hash(_storeList));

  @JsonKey(ignore: true)
  @override
  _$$_ProfilePageDataCopyWith<_$_ProfilePageData> get copyWith =>
      __$$_ProfilePageDataCopyWithImpl<_$_ProfilePageData>(this, _$identity);
}

abstract class _ProfilePageData extends ProfilePageData {
  const factory _ProfilePageData(
      {final bool showNavigation,
      final List<StoreListModel> storeList}) = _$_ProfilePageData;
  const _ProfilePageData._() : super._();

  @override
  bool get showNavigation;
  @override
  List<StoreListModel> get storeList;
  @override
  @JsonKey(ignore: true)
  _$$_ProfilePageDataCopyWith<_$_ProfilePageData> get copyWith =>
      throw _privateConstructorUsedError;
}
