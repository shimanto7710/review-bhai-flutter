
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class ProfileEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends ProfileEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends ProfileEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends ProfileEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends ProfileEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}