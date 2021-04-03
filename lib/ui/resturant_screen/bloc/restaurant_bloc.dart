import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/resturant_screen/bloc/restaurant_event.dart';
import 'package:reviewbahi/ui/resturant_screen/bloc/restaurant_state.dart';






class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(null);



  @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}