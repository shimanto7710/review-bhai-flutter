
import 'package:equatable/equatable.dart';

class DetailInfoState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends DetailInfoState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends DetailInfoState{

}

class LoadedState extends DetailInfoState{

}

class InitState extends DetailInfoState{

}