
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class HomeFragmentEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends HomeFragmentEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends HomeFragmentEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends HomeFragmentEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends HomeFragmentEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}