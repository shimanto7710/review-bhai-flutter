
import 'package:equatable/equatable.dart';

class WriteQueState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends WriteQueState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends WriteQueState{

}

class LoadedState extends WriteQueState{

}

class InitState extends WriteQueState{

}