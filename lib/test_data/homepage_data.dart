import 'package:freezed_annotation/freezed_annotation.dart';
part 'homepage_data.freezed.dart';
part 'homepage_data.g.dart';

@freezed
class HomePageData with _$HomePageData {
  const factory HomePageData({
    
    required bool hideNavigation,
    required bool showNavigation,
    required int bottomNaviChange,
    required List pageList,
  }) = _HomePageData;

  factory HomePageData.fromJson(Map<String, dynamic> json) =>
      _$HomePageDataFromJson(json);
}
