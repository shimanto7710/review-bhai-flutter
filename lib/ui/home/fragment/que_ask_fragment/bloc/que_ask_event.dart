
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class AskEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends AskEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends AskEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends AskEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends AskEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}