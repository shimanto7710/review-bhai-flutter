
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class WriteQueEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends WriteQueEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends WriteQueEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends WriteQueEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends WriteQueEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}