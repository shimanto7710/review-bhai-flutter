
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class AskDetailEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends AskDetailEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends AskDetailEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends AskDetailEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends AskDetailEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}