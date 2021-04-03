
import 'package:equatable/equatable.dart';

class RestaurantState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends RestaurantState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends RestaurantState{

}

class LoadedState extends RestaurantState{

}

class InitState extends RestaurantState{

}