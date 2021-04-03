import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FilterEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}



class InitEvent extends FilterEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends FilterEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}