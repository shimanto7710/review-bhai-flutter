import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}



class InitEvent extends HomeEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends HomeEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}