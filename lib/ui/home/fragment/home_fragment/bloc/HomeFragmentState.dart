

import 'package:equatable/equatable.dart';

class HomeFragmentState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends HomeFragmentState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends HomeFragmentState{

}

class LoadedState extends HomeFragmentState{

}

class InitState extends HomeFragmentState{

}