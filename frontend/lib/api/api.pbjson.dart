//
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use activityTypeDescriptor instead')
const ActivityType$json = {
  '1': 'ActivityType',
  '2': [
    {'1': 'WalkingInstead', '2': 0},
    {'1': 'UseBicycle', '2': 1},
    {'1': 'TurnOffFireplace', '2': 2},
  ],
};

/// Descriptor for `ActivityType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List activityTypeDescriptor = $convert.base64Decode(
    'CgxBY3Rpdml0eVR5cGUSEgoOV2Fsa2luZ0luc3RlYWQQABIOCgpVc2VCaWN5Y2xlEAESFAoQVH'
    'Vybk9mZkZpcmVwbGFjZRAC');

@$core.Deprecated('Use locationDescriptor instead')
const Location$json = {
  '1': 'Location',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 2, '10': 'lat'},
    {'1': 'lon', '3': 2, '4': 1, '5': 2, '10': 'lon'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode(
    'CghMb2NhdGlvbhIQCgNsYXQYASABKAJSA2xhdBIQCgNsb24YAiABKAJSA2xvbg==');

@$core.Deprecated('Use airQualityDescriptor instead')
const AirQuality$json = {
  '1': 'AirQuality',
};

/// Descriptor for `AirQuality`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airQualityDescriptor = $convert.base64Decode(
    'CgpBaXJRdWFsaXR5');

@$core.Deprecated('Use waterQualityDescriptor instead')
const WaterQuality$json = {
  '1': 'WaterQuality',
};

/// Descriptor for `WaterQuality`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List waterQualityDescriptor = $convert.base64Decode(
    'CgxXYXRlclF1YWxpdHk=');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use notificationDescriptor instead')
const Notification$json = {
  '1': 'Notification',
};

/// Descriptor for `Notification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationDescriptor = $convert.base64Decode(
    'CgxOb3RpZmljYXRpb24=');

@$core.Deprecated('Use activityDescriptor instead')
const Activity$json = {
  '1': 'Activity',
  '2': [
    {'1': 'activity_type', '3': 1, '4': 1, '5': 14, '6': '.nasa.ActivityType', '10': 'activityType'},
  ],
};

/// Descriptor for `Activity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activityDescriptor = $convert.base64Decode(
    'CghBY3Rpdml0eRI3Cg1hY3Rpdml0eV90eXBlGAEgASgOMhIubmFzYS5BY3Rpdml0eVR5cGVSDG'
    'FjdGl2aXR5VHlwZQ==');

@$core.Deprecated('Use messageChatDescriptor instead')
const MessageChat$json = {
  '1': 'MessageChat',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `MessageChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageChatDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlQ2hhdBISCgR0ZXh0GAEgASgJUgR0ZXh0');

