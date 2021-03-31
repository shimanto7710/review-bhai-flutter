
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class NotificationEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends NotificationEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends NotificationEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends NotificationEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends NotificationEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}