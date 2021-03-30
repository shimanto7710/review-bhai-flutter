import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PinEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class SendOtpEvent extends PinEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends PinEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends PinEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}

