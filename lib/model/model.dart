import 'package:flutter/material.dart';

@immutable
class StoreListModel {
  const StoreListModel(
    this.address,
    this.img_url,
    this.name,
    this.phone,
  );
  final String address;
  final String img_url;
  final String name;
  final String phone;
}