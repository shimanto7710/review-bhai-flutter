
import 'package:equatable/equatable.dart';

class WriteReviewState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends WriteReviewState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends WriteReviewState{

}

class LoadedState extends WriteReviewState{

}

class InitState extends WriteReviewState{

}