// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lunch_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LunchInfo {
  String get day => throw _privateConstructorUsedError;
  String get menuName => throw _privateConstructorUsedError;
  String get menu => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LunchInfoCopyWith<LunchInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LunchInfoCopyWith<$Res> {
  factory $LunchInfoCopyWith(LunchInfo value, $Res Function(LunchInfo) then) =
      _$LunchInfoCopyWithImpl<$Res, LunchInfo>;
  @useResult
  $Res call({String day, String menuName, String menu});
}

/// @nodoc
class _$LunchInfoCopyWithImpl<$Res, $Val extends LunchInfo>
    implements $LunchInfoCopyWith<$Res> {
  _$LunchInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? menuName = null,
    Object? menu = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LunchInfoImplCopyWith<$Res>
    implements $LunchInfoCopyWith<$Res> {
  factory _$$LunchInfoImplCopyWith(
          _$LunchInfoImpl value, $Res Function(_$LunchInfoImpl) then) =
      __$$LunchInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, String menuName, String menu});
}

/// @nodoc
class __$$LunchInfoImplCopyWithImpl<$Res>
    extends _$LunchInfoCopyWithImpl<$Res, _$LunchInfoImpl>
    implements _$$LunchInfoImplCopyWith<$Res> {
  __$$LunchInfoImplCopyWithImpl(
      _$LunchInfoImpl _value, $Res Function(_$LunchInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? menuName = null,
    Object? menu = null,
  }) {
    return _then(_$LunchInfoImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LunchInfoImpl with DiagnosticableTreeMixin implements _LunchInfo {
  _$LunchInfoImpl(
      {required this.day, required this.menuName, required this.menu});

  @override
  final String day;
  @override
  final String menuName;
  @override
  final String menu;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LunchInfo(day: $day, menuName: $menuName, menu: $menu)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LunchInfo'))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('menuName', menuName))
      ..add(DiagnosticsProperty('menu', menu));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LunchInfoImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, day, menuName, menu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LunchInfoImplCopyWith<_$LunchInfoImpl> get copyWith =>
      __$$LunchInfoImplCopyWithImpl<_$LunchInfoImpl>(this, _$identity);
}

abstract class _LunchInfo implements LunchInfo {
  factory _LunchInfo(
      {required final String day,
      required final String menuName,
      required final String menu}) = _$LunchInfoImpl;

  @override
  String get day;
  @override
  String get menuName;
  @override
  String get menu;
  @override
  @JsonKey(ignore: true)
  _$$LunchInfoImplCopyWith<_$LunchInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
