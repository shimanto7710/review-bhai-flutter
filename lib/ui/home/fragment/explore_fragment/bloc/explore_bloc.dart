import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/home/fragment/explore_fragment/bloc/explore_event.dart';
import 'package:reviewbahi/ui/home/fragment/explore_fragment/bloc/explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(null);



  @override
  Stream<ExploreState> mapEventToState(ExploreEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}