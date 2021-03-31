
import 'package:equatable/equatable.dart';

class ExploreState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends ExploreState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends ExploreState{

}

class LoadedState extends ExploreState{

}

class InitState extends ExploreState{

}