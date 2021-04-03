
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class FoodItemEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends FoodItemEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends FoodItemEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends FoodItemEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends FoodItemEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}