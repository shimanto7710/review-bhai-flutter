

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/home/fragment/home_fragment/bloc/HomeFragmentEvent.dart';
import 'package:reviewbahi/ui/home/fragment/home_fragment/bloc/HomeFragmentState.dart';


class HomeFragmentBloc extends Bloc<HomeFragmentEvent, HomeFragmentState> {
  HomeFragmentBloc() : super(null);



  @override
  Stream<HomeFragmentState> mapEventToState(HomeFragmentEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}