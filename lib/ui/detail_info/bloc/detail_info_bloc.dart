import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/detail_info/bloc/detail_info_event.dart';
import 'package:reviewbahi/ui/detail_info/bloc/detail_info_state.dart';


class DetailInfoBloc extends Bloc<DetailInfoEvent, DetailInfoState> {
  DetailInfoBloc() : super(null);



  @override
  Stream<DetailInfoState> mapEventToState(DetailInfoEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}