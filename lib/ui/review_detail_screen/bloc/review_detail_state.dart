
import 'package:equatable/equatable.dart';

class ReviewDetailState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends ReviewDetailState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends ReviewDetailState{

}

class LoadedState extends ReviewDetailState{

}

class InitState extends ReviewDetailState{

}