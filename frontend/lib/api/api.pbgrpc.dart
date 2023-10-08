//
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'api.pb.dart' as $0;

export 'api.pb.dart';

@$pb.GrpcServiceName('nasa.NasaService')
class NasaServiceClient extends $grpc.Client {
  static final _$getWaterQuality = $grpc.ClientMethod<$0.Location, $0.WaterQuality>(
      '/nasa.NasaService/GetWaterQuality',
      ($0.Location value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.WaterQuality.fromBuffer(value));
  static final _$getAirQuality = $grpc.ClientMethod<$0.Location, $0.AirQuality>(
      '/nasa.NasaService/GetAirQuality',
      ($0.Location value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AirQuality.fromBuffer(value));
  static final _$notify = $grpc.ClientMethod<$0.Notification, $0.Empty>(
      '/nasa.NasaService/Notify',
      ($0.Notification value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$sendActivity = $grpc.ClientMethod<$0.Activity, $0.Empty>(
      '/nasa.NasaService/SendActivity',
      ($0.Activity value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  NasaServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.WaterQuality> getWaterQuality($0.Location request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getWaterQuality, request, options: options);
  }

  $grpc.ResponseFuture<$0.AirQuality> getAirQuality($0.Location request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAirQuality, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> notify($async.Stream<$0.Notification> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$notify, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.Empty> sendActivity($0.Activity request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendActivity, request, options: options);
  }
}

@$pb.GrpcServiceName('nasa.NasaService')
abstract class NasaServiceBase extends $grpc.Service {
  $core.String get $name => 'nasa.NasaService';

  NasaServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Location, $0.WaterQuality>(
        'GetWaterQuality',
        getWaterQuality_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Location.fromBuffer(value),
        ($0.WaterQuality value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Location, $0.AirQuality>(
        'GetAirQuality',
        getAirQuality_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Location.fromBuffer(value),
        ($0.AirQuality value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Notification, $0.Empty>(
        'Notify',
        notify,
        true,
        false,
        ($core.List<$core.int> value) => $0.Notification.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Activity, $0.Empty>(
        'SendActivity',
        sendActivity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Activity.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.WaterQuality> getWaterQuality_Pre($grpc.ServiceCall call, $async.Future<$0.Location> request) async {
    return getWaterQuality(call, await request);
  }

  $async.Future<$0.AirQuality> getAirQuality_Pre($grpc.ServiceCall call, $async.Future<$0.Location> request) async {
    return getAirQuality(call, await request);
  }

  $async.Future<$0.Empty> sendActivity_Pre($grpc.ServiceCall call, $async.Future<$0.Activity> request) async {
    return sendActivity(call, await request);
  }

  $async.Future<$0.WaterQuality> getWaterQuality($grpc.ServiceCall call, $0.Location request);
  $async.Future<$0.AirQuality> getAirQuality($grpc.ServiceCall call, $0.Location request);
  $async.Future<$0.Empty> notify($grpc.ServiceCall call, $async.Stream<$0.Notification> request);
  $async.Future<$0.Empty> sendActivity($grpc.ServiceCall call, $0.Activity request);
}
@$pb.GrpcServiceName('nasa.ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$sendMessage = $grpc.ClientMethod<$0.MessageChat, $0.MessageChat>(
      '/nasa.ChatService/SendMessage',
      ($0.MessageChat value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MessageChat.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.MessageChat> sendMessage($0.MessageChat request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }
}

@$pb.GrpcServiceName('nasa.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'nasa.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MessageChat, $0.MessageChat>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MessageChat.fromBuffer(value),
        ($0.MessageChat value) => value.writeToBuffer()));
  }

  $async.Future<$0.MessageChat> sendMessage_Pre($grpc.ServiceCall call, $async.Future<$0.MessageChat> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$0.MessageChat> sendMessage($grpc.ServiceCall call, $0.MessageChat request);
}
