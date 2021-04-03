
import 'package:equatable/equatable.dart';

class AskDetailState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends AskDetailState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends AskDetailState{

}

class LoadedState extends AskDetailState{

}

class InitState extends AskDetailState{

}