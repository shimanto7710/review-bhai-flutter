import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/network/firebaseRepo.dart';
import 'package:reviewbahi/ui/login_pin/bloc/pin_event.dart';
import 'package:reviewbahi/ui/login_pin/bloc/pin_state.dart';


class PinBloc extends Bloc<PinEvent, PinState> {
  PinBloc() : super(null) {
    _firebaseRepo = FirebaseRepo(FirebaseAuth.instance);
  }

  FirebaseRepo _firebaseRepo;

  @override
  Stream<PinState> mapEventToState(PinEvent event) async* {
    if (event is SendOtpEvent) {
      yield LoadingState();
      try {
        // final result = await _firebaseRepo.sendOtp(phoneNumber: "+8801744223515");

      } catch (_) {
        yield OtpErrorState("Error from server");
      }
    }
    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield OtpErrorState(event.msg);
    }
  }
}
