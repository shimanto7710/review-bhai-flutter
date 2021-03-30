

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/home/bloc/home_event.dart';
import 'package:reviewbahi/ui/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(null);



  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield OtpErrorState(event.msg);
    }
  }
}