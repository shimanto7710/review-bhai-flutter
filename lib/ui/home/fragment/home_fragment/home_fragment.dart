import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/home/fragment/home_fragment/bloc/HomeFragmentBloc.dart';
import 'package:reviewbahi/ui/home/fragment/home_fragment/bloc/HomeFragmentState.dart';
import 'package:reviewbahi/ui/home/fragment/home_fragment/bloc/HomeFragmentState.dart';
import 'package:reviewbahi/ui/home/fragment/home_fragment/bloc/HomeFragmentState.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class HomeFragment extends StatefulWidget {


  @override
  _HomeFragmentState createState() => _HomeFragmentState();


}

class _HomeFragmentState extends State<HomeFragment> {
  HomeFragmentBloc _bloc;
  ScrollController controller=ScrollController();
  @override
  void initState() {
    _bloc = new HomeFragmentBloc();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider<HomeFragmentBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<HomeFragmentBloc, HomeFragmentState>(
          listener: (BuildContext context, HomeFragmentState state) {
            // ignore: missing_return
          },
          // ignore: missing_return
          builder: (BuildContext context, HomeFragmentState state) {
            return Snap(
              controller: controller.appBar,
              child: Container(
                child: Container(
                  color: Colors.black12,
                  child: new ListView.builder(

                    itemCount: 10,
                    // ignore: missing_return
                    itemBuilder: (BuildContext context, int index) {
                      return Card(child: Container(height: 200,width: 200,),);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
