import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/food_item/bloc/food_item_event.dart';
import 'package:reviewbahi/ui/food_item/bloc/food_item_state.dart';






class FoodItemBloc extends Bloc<FoodItemEvent, FoodItemState> {
  FoodItemBloc() : super(null);



  @override
  Stream<FoodItemState> mapEventToState(FoodItemEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}