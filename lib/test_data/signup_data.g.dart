// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpData _$$_SignUpDataFromJson(Map<String, dynamic> json) =>
    _$_SignUpData(
      email: json['email'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      processing: json['processing'] as bool,
    );

Map<String, dynamic> _$$_SignUpDataToJson(_$_SignUpData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
      'processing': instance.processing,
    };
