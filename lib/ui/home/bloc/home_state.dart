
import 'package:equatable/equatable.dart';

class HomeState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class OtpErrorState extends HomeState{
  String msg;
  OtpErrorState(this.msg);
}



class LoadingState extends HomeState{

}

class InitState extends HomeState{

}