
import 'package:flutter/material.dart';

class AdditionFragment extends StatefulWidget {
  @override
  _AdditionFragmentState createState() => _AdditionFragmentState();
}

class _AdditionFragmentState extends State<AdditionFragment> {


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void bottomSheet(){
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                MaterialButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
