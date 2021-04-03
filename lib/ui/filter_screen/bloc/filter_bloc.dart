

import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_event.dart';
import 'filter_state.dart';




class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(null);



  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}