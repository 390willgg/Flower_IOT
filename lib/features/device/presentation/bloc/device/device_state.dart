part of 'device_bloc.dart';

abstract class DeviceState extends Equatable {}

class DeviceStateEmpty extends DeviceState {
  @override
  List<Object?> get props => [];
}

class DeviceStateLoading extends DeviceState {
  @override
  List<Object?> get props => [];
}

class DeviceStateLoaded extends DeviceState {
  final Device? device;
  DeviceStateLoaded(this.device);

  @override
  List<Object?> get props => [device];
}

class DeviceStateError extends DeviceState {
  final String message;
  DeviceStateError(this.message);

  @override
  List<Object?> get props => [message];
}
