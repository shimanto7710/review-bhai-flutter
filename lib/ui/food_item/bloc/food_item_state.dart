
import 'package:equatable/equatable.dart';

class FoodItemState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ErrorState extends FoodItemState{
  String msg;
  ErrorState(this.msg);
}


class LoadingState extends FoodItemState{

}

class LoadedState extends FoodItemState{

}

class InitState extends FoodItemState{

}