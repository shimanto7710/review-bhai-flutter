
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class ReviewDetailEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends ReviewDetailEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends ReviewDetailEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends ReviewDetailEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends ReviewDetailEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}