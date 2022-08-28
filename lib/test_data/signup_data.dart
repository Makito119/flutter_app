import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_data.freezed.dart';
part 'signup_data.g.dart';

@freezed
class SignUpData with _$SignUpData {
  const factory SignUpData({
    
    required String email,
    required String name,
    required String password,


  }) = _SignUpData;

  factory SignUpData.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataFromJson(json);
}
