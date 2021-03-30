
import 'package:equatable/equatable.dart';

class PinState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class OtpErrorState extends PinState{
  String msg;
  OtpErrorState(this.msg);
}

class OtpSentState extends PinState{

}

class LoadingState extends PinState{

}

class InitState extends PinState{

}