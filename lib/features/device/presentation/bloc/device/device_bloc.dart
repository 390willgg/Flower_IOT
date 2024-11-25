import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../exceptions/error/failure.dart';
import '../../../domain/entities/device/device.dart';
import '../../../domain/usecases/get_device.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final GetDevice getDevice;

  DeviceBloc(this.getDevice) : super(DeviceStateEmpty()) {
    on<DeviceEventGetDevice>((event, emit) async {
      emit(DeviceStateLoading());
      Either<Failure, Device?> resultGetDevice =
          await getDevice.execute(event.deviceId);

      resultGetDevice.fold(
        (failure) => emit(DeviceStateError("Failed to get device")),
        (device) => emit(DeviceStateLoaded(device)),
      );
    });
  }
}
