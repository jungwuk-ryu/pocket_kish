import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String title,
    required String url,
    required String date
}) = _Post;
}