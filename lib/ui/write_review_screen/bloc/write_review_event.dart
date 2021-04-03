
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class WriteReviewEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoadingEvent extends WriteReviewEvent{

  @override
  List<Object> get props => [];

}

class LoadedEvent extends WriteReviewEvent{

  @override
  List<Object> get props => [];

}

class InitEvent extends WriteReviewEvent{

  @override
  List<Object> get props => [];

}

class ErrorEvent extends WriteReviewEvent{
  String msg;
  ErrorEvent({@required this.msg});
  @override
  List<Object> get props => [];

}