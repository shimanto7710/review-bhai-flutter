
import 'package:equatable/equatable.dart';

class ProfileState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends ProfileState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends ProfileState{

}

class LoadedState extends ProfileState{

}

class InitState extends ProfileState{

}