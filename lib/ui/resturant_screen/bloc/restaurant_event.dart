
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class RestaurantEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends RestaurantEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends RestaurantEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends RestaurantEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends RestaurantEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}