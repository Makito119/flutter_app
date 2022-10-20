import 'package:freezed_annotation/freezed_annotation.dart';
part 'shotpage_data.freezed.dart';
part 'shotpage_data.g.dart';

@freezed
class ShotPageData with _$ShotPageData {
  const ShotPageData._();
  const factory ShotPageData({
    @Default('') String img,
    @Default([]) List imgList,
  }) = _ShotPageData;

  factory ShotPageData.fromJson(Map<String, dynamic> json) =>
      _$ShotPageDataFromJson(json);
}