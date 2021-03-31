
import 'package:equatable/equatable.dart';

class AskState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends AskState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends AskState{

}

class LoadedState extends AskState{

}

class InitState extends AskState{

}