import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:image_picker/image_picker.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/detail_info/bloc/detail_info_bloc.dart';
import 'package:reviewbahi/ui/detail_info/bloc/detail_info_state.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reviewbahi/ui/home/home.dart';

class DetailInfoScreen extends StatefulWidget {
  static const routeName = '/detailScreen';

  @override
  _DetailInfoScreenState createState() => _DetailInfoScreenState();
}

enum SingingCharacter { Male, Female }

class _DetailInfoScreenState extends State<DetailInfoScreen> {
  DetailInfoBloc _bloc;
  SingingCharacter _character = SingingCharacter.Male;
  TextEditingController userNameController;
  TextEditingController genderController;
  TextEditingController userTypeController;
  final _formKey = GlobalKey<FormState>();

  String _genderGrop = "gender";
  String _userTypeGroup = "userType";

  List<String> _gender_status = ["Male", "Female"];
  List<String> _userTypeStatus = ["User", "Owner"];

  File cameraFile;

  @override
  void initState() {
    _bloc = new DetailInfoBloc();

    userNameController = TextEditingController();
    genderController = TextEditingController();
    userTypeController = TextEditingController();
  }

  @override
  void dispose() {
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          "Detail Info",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocProvider<DetailInfoBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<DetailInfoBloc, DetailInfoState>(
          listener: (BuildContext context, DetailInfoState state) {
            // ignore: missing_return
          },
          // ignore: missing_return
          builder: (BuildContext context, DetailInfoState state) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 100),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height/10,),
                    Container(
                      width: size.width,
                      margin: EdgeInsets.only(left: 32, right: 32),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: CustomColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.person,
                                color: CustomColors.primaryColor,
                                size: 26,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 2,
                              color: CustomColors.primaryColor,
                              margin: EdgeInsets.only(left: 16),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 10, bottom: 0),
                                child: TextFormField(
                                  onChanged: (text) {},
                                  controller: userNameController,
                                  style: TextStyle(
                                      color: CustomColors.primaryColor,
                                      fontSize: 20),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "User Name",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: size.width,
                      margin: EdgeInsets.only(left: 32, right: 32),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: CustomColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Image.asset("assets/icons/gender.png")),
                            Container(
                              height: 50,
                              width: 2,
                              color: CustomColors.primaryColor,
                              margin: EdgeInsets.only(left: 16),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10, bottom: 0),
                              child: Container(
                                child: RadioGroup<String>.builder(
                                  direction: Axis.horizontal,
                                  groupValue: _genderGrop,
                                  onChanged: (value) => setState(() {
                                    _genderGrop = value;
                                  }),
                                  items: _gender_status,
                                  itemBuilder: (item) => RadioButtonBuilder(
                                    item,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: size.width,
                      margin: EdgeInsets.only(left: 32, right: 32),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: CustomColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.supervised_user_circle,
                                color: CustomColors.primaryColor,
                                size: 26,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 2,
                              color: CustomColors.primaryColor,
                              margin: EdgeInsets.only(left: 16),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10, bottom: 0),
                              child: Container(
                                child: RadioGroup<String>.builder(
                                  direction: Axis.horizontal,
                                  groupValue: _userTypeGroup,
                                  onChanged: (value) => setState(() {
                                    _userTypeGroup = value;
                                  }),
                                  items: _userTypeStatus,
                                  itemBuilder: (item) => RadioButtonBuilder(
                                    item,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: size.width,
                      margin: EdgeInsets.only(left: 32, right: 32),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: CustomColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.person,
                                color: CustomColors.primaryColor,
                                size: 26,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 2,
                              color: CustomColors.primaryColor,
                              margin: EdgeInsets.only(left: 16),
                            ),
                            Flexible(
                              child: InkWell(
                                // onTap: selectFromCamera,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: 10, bottom: 0),
                                  child: Text("Take a profile picture"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 45,
                      margin: EdgeInsets.only(top: 70),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.primaryColor.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                        // border: Border.all(
                        //     color: CustomColors.primaryColor, width: 3),
                      ),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        color: CustomColors.primaryColor,
                        onPressed: () {_dummyDestination();},
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

// Future<void> _optionsDialogBox() {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: new SingleChildScrollView(
//             child: new ListBody(
//               children: <Widget>[
//                 GestureDetector(
//                   child: new Text('Take a picture'),
//                   onTap: openCamera,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                 ),
//                 GestureDetector(
//                   child: new Text('Select from gallery'),
//                   onTap: openGallery,
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }

//display image selected from gallery
// selectFromCamera() async {
//   cameraFile = await ImagePicker.pickImage(
//     source: ImageSource.camera,
//     // maxHeight: 50.0,
//     // maxWidth: 50.0,
//   );
//   setState(() {});
// }

// void openCamera() async {
//   var picture = await ImagePicker.pickImage(
//     source: ImageSource.camera,
//   );
//   setState(() {});
// }

// void openGallery() async {
//   var gallery = await ImagePicker.pickImage(
//     source: ImageSource.gallery,
//   );
//   setState(() {});
// }



  _dummyDestination() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
  }
}
