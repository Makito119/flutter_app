import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_data.freezed.dart';
part 'signup_data.g.dart';

@freezed
class SignUpData with _$SignUpData {
  const factory SignUpData({
    @Default('') String? name,
    @Default('') String? uid,
  }) = _SignUpData;

  factory SignUpData.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataFromJson(json);
}
