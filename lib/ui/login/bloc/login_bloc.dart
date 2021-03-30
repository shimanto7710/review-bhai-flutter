import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/network/firebaseRepo.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(null) {
    _firebaseRepo = FirebaseRepo(FirebaseAuth.instance);
  }

  FirebaseRepo _firebaseRepo;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
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
