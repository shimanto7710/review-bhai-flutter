
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class ExploreEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends ExploreEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends ExploreEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends ExploreEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends ExploreEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}