


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/home/fragment/notification_fragment/bloc/notification_event.dart';
import 'package:reviewbahi/ui/home/fragment/notification_fragment/bloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(null);



  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}