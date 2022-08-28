import 'package:freezed_annotation/freezed_annotation.dart';
part 'profilepage_data.freezed.dart';
part 'profilepage_data.g.dart';

@freezed
class ProfilePageData with _$ProfilePageData {
  const factory ProfilePageData({
    
 
    required bool showNavigation,

  }) = _ProfilePageData;

  factory ProfilePageData.fromJson(Map<String, dynamic> json) =>
      _$ProfilePageDataFromJson(json);
}
