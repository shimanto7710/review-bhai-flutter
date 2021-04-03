import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/write_que_screen/bloc/write_que_bloc.dart';
import 'package:reviewbahi/ui/write_que_screen/bloc/write_que_state.dart';

class WriteQueScreen extends StatefulWidget {
  static const routeName = '/writeQueScreen';

  @override
  _WriteQueScreenState createState() => _WriteQueScreenState();
}

class _WriteQueScreenState extends State<WriteQueScreen> {
  WriteQueBloc _bloc;

  final maxLines = 5;
  List<String> _foodItem = [];

  @override
  void initState() {
    _bloc = WriteQueBloc();

    _foodItem.add("1");
    _foodItem.add("2");
    _foodItem.add("1");
    _foodItem.add("2");
    _foodItem.add("1");
    _foodItem.add("2");
    _foodItem.add("1");
    _foodItem.add("2");
  }

  @override
  void dispose() {
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Ask a Que.",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            child: Text(
              "Done",
              style: TextStyle(
                color: CustomColors.primaryColor,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocProvider<WriteQueBloc>(
          create: (_) => _bloc,
          // ignore: missing_return
          child: BlocConsumer<WriteQueBloc, WriteQueState>(
              listener: (BuildContext context, WriteQueState state) {
            // ignore: missing_return
          },
              // ignore: missing_return
              builder: (BuildContext context, WriteQueState state) {
            return Container(
              color: CustomColors.ratingBg,
              child: ListView(
                children: [
                  Card(
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Title",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 75.0,
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: "Type a text",
                                  fillColor: CustomColors.textFieldBg,
                                  filled: true,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Description",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: maxLines * 24.0,
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  hintText: "Type a text",
                                  fillColor: CustomColors.textFieldBg,
                                  filled: true,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Images",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 5, top: 5, bottom: 10),
                            height: 80,
                            child: new ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _foodItem.length,
                              scrollDirection: Axis.horizontal,
                              // ignore: missing_return
                              itemBuilder: (BuildContext context, int index) {
                                return _iamgeListItem(context, index);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }

  Widget _iamgeListItem(BuildContext context, int index) {
    String item = _foodItem[index];
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.0),
              child: Image.asset(
                "assets/imgs/${item}.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              right: 12,
              top: 3,
              child: Icon(
                Icons.close,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
