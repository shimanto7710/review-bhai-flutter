
import 'package:equatable/equatable.dart';

class NotificationState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends NotificationState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends NotificationState{

}

class LoadedState extends NotificationState{

}

class InitState extends NotificationState{

}