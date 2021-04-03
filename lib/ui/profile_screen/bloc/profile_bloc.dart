import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/profile_screen/bloc/profile_event.dart';

import 'package:reviewbahi/ui/profile_screen/bloc/profile_state.dart';






class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(null);



  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}