
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class DetailInfoEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends DetailInfoEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends DetailInfoEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends DetailInfoEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends DetailInfoEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}