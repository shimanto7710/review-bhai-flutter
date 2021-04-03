
import 'package:equatable/equatable.dart';

class FilterState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends FilterState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends FilterState{

}

class LoadedState extends FilterState{

}

class InitState extends FilterState{

}