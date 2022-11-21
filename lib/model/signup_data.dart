import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_data.freezed.dart';

@freezed
class SignUpData with _$SignUpData {
  const factory SignUpData(
      {@Default('') String? name,
      @Default('') String? uid,
      @Default('') String? phone,
      @Default('') String? gender,
      @Default('') String? imag_url}) = _SignUpData;
}
