import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/write_que_screen/bloc/write_que_event.dart';

import 'package:reviewbahi/ui/write_que_screen/bloc/write_que_state.dart';




class WriteQueBloc extends Bloc<WriteQueEvent, WriteQueState> {
  WriteQueBloc() : super(null);



  @override
  Stream<WriteQueState> mapEventToState(WriteQueEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}