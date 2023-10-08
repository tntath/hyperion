//
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ActivityType extends $pb.ProtobufEnum {
  static const ActivityType WalkingInstead = ActivityType._(0, _omitEnumNames ? '' : 'WalkingInstead');
  static const ActivityType UseBicycle = ActivityType._(1, _omitEnumNames ? '' : 'UseBicycle');
  static const ActivityType TurnOffFireplace = ActivityType._(2, _omitEnumNames ? '' : 'TurnOffFireplace');

  static const $core.List<ActivityType> values = <ActivityType> [
    WalkingInstead,
    UseBicycle,
    TurnOffFireplace,
  ];

  static final $core.Map<$core.int, ActivityType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ActivityType? valueOf($core.int value) => _byValue[value];

  const ActivityType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
