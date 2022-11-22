import 'package:flutter_shot_dev/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profilepage_data.freezed.dart';

@freezed
class ProfilePageData with _$ProfilePageData {
  const ProfilePageData._();
  const factory ProfilePageData({
    @Default(true) bool showNavigation,
    @Default(<StoreListModel>[]) List<StoreListModel> storeList,
  }) = _ProfilePageData;
}
