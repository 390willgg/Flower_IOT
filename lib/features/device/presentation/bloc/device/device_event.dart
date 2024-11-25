part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {}

class DeviceEventGetDevice extends DeviceEvent {
  final String deviceId;
  DeviceEventGetDevice(this.deviceId);

  @override
  List<Object?> get props => [deviceId];
}
