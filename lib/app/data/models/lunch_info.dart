import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'lunch_info.freezed.dart';

@freezed
class LunchInfo with _$LunchInfo {
  factory LunchInfo({
    required String day,
    required String menuName,
    required String menu
}) = _LunchInfo;
}