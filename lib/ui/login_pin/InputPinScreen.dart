import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:reviewbahi/core/MyColor.dart';


import 'bloc/pin_bloc.dart';
import 'bloc/pin_event.dart';
import 'bloc/pin_state.dart';

class PinPutView extends StatefulWidget {
  static const routeName = '/pinScreen';
  PinPutView({ @required this.verificationId,@required this.resendToken,@required this.phoneNumber}) : super();

  String verificationId;
  int resendToken;
  String phoneNumber;
  @override
  PinPutViewState createState() => PinPutViewState(verificationId: verificationId,resendToken: resendToken,phoneNumber: phoneNumber);
}

class PinPutViewState extends State<PinPutView> {
  String verificationId;
  int resendToken;
  String phoneNumber;


  PinPutViewState({ @required this.verificationId,@required this.resendToken,@required this.phoneNumber}) : super();

  final _formKey = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final _pageController = PageController();

  int _pageIndex = 0;

  final List<Widget> _pinPuts = [];

  final List<Color> _bgColors = [
    Colors.white,
    const Color.fromRGBO(43, 36, 198, 1),
    Colors.white,
    const Color.fromRGBO(75, 83, 214, 1),
    const Color.fromRGBO(43, 46, 66, 1),
  ];

  PinBloc _bloc;
  var screenWidth;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    _bloc = new PinBloc();
    print(verificationId);
    print(resendToken);
    print(phoneNumber);
    // inputNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    //Close the Stream Sink when the widget is disposed
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    _pinPuts.addAll([
      darkRoundedPinPut(),
      animatingBorders(),
      boxedPinPutWithPreFilledSymbol(),
      justRoundedCornersPinPut(),
    ]);
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(235, 236, 237, 1),
      borderRadius: BorderRadius.circular(5.0),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<PinBloc>(
        create: (_) => _bloc,
        child: BlocConsumer<PinBloc, PinState>(
            listener: (BuildContext context, PinState state) {
          // ignore: missing_return
        }, builder: (BuildContext context, PinState state) {
          return SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: screenWidth / 5,top: 30),
                      child: SvgPicture.asset("assets/icons/otp_send.svg"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "OTP Verification",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Enter the OTP to',
                                style: TextStyle(fontSize: 15)),
                            TextSpan(
                                text: ' $phoneNumber',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(margin: EdgeInsets.only(left: 16,right: 16),
                              child: GestureDetector(
                                onLongPress: () {
                                  print(_formKey.currentState.validate());
                                },
                                child: PinPut(
                                  // validator: (s) {
                                  //   if (s.contains('1')) return null;
                                  //   return 'NOT VALID';
                                  // },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                                  withCursor: true,
                                  fieldsCount: 6,
                                  fieldsAlignment: MainAxisAlignment.spaceAround,
                                  textStyle:
                                      const TextStyle(fontSize: 25.0, color: Colors.black),
                                  eachFieldMargin: EdgeInsets.all(0),
                                  eachFieldWidth: 45.0,
                                  eachFieldHeight: 55.0,
                                  onSubmit: (String pin) => _showSnackBar(pin),
                                  focusNode: _pinPutFocusNode,
                                  controller: _pinPutController,
                                  submittedFieldDecoration: pinPutDecoration,
                                  selectedFieldDecoration: pinPutDecoration.copyWith(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromRGBO(160, 215, 220, 1),
                                    ),
                                  ),
                                  followingFieldDecoration: pinPutDecoration,
                                  pinAnimationType: PinAnimationType.scale,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            (state is OtpErrorState)
                                ? Container(
                                child: Text(
                                  state.msg,
                                  style: TextStyle(
                                      color: CustomColors.primaryColor),
                                ))
                                : Container(),

                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Do not receive the OTP?',
                                        style: TextStyle(fontSize: 15)),
                                    TextSpan(
                                        recognizer:  TapGestureRecognizer()..onTap = () {
                                          print("on resend click");
                                        },
                                        text: '  RESEND OTP',
                                        style: TextStyle(color: CustomColors.primaryColor,
                                            fontSize: 17, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            Container(
                              width: MediaQuery.of(context).size.width - 30,
                              height: 45,
                              margin: EdgeInsets.all(15),
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
                              child: (state is LoadingState)
                                  ? MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                color: CustomColors.primaryColor,
                                onPressed: () {
                                  _bloc.add(SendOtpEvent());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.redAccent,
                                        valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                        strokeWidth: 5,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Please Wait",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                                  : MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                color: CustomColors.primaryColor,
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    print(_pinPutController.text);
                                    if (_pinPutController.text.toString().length !=
                                        6) {
                                      _bloc.add(ErrorEvent(msg: "Invalid OTP"));
                                    } else {
                                      _bloc.add(SendOtpEvent());
                                    }
                                  }
                                },
                                child: Text(
                                  "VERIFY & PROCEED",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),


                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }



  Widget extras() {
    return Container(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            color: Colors.red,
            child: AnimatedContainer(
              color: _bgColors[_pageIndex],
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(40.0),
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _pageIndex = index);
                },
                children: _pinPuts.map((p) {
                  return FractionallySizedBox(
                    heightFactor: 1.0,
                    child: Center(child: p),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget darkRoundedPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(25, 21, 99, 1),
      borderRadius: BorderRadius.circular(20.0),
    );
    return PinPut(
      eachFieldWidth: 65.0,
      eachFieldHeight: 65.0,
      withCursor: true,
      fieldsCount: 4,
      focusNode: _pinPutFocusNode,
      controller: _pinPutController,
      onSubmit: (String pin) => _showSnackBar(pin),
      submittedFieldDecoration: pinPutDecoration,
      selectedFieldDecoration: pinPutDecoration,
      followingFieldDecoration: pinPutDecoration,
      pinAnimationType: PinAnimationType.scale,
      textStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
    );
  }

  Widget animatingBorders() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
    return PinPut(
      fieldsCount: 5,
      eachFieldHeight: 40.0,
      withCursor: true,
      onSubmit: (String pin) => _showSnackBar(pin),
      focusNode: _pinPutFocusNode,
      controller: _pinPutController,
      submittedFieldDecoration: pinPutDecoration.copyWith(
        borderRadius: BorderRadius.circular(20.0),
      ),
      selectedFieldDecoration: pinPutDecoration,
      followingFieldDecoration: pinPutDecoration.copyWith(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.deepPurpleAccent.withOpacity(.5),
        ),
      ),
    );
  }

  Widget boxedPinPutWithPreFilledSymbol() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(119, 125, 226, 1),
      borderRadius: BorderRadius.circular(5.0),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.all(20.0),
      child: PinPut(
        withCursor: true,
        fieldsCount: 5,
        preFilledWidget: FlutterLogo(),
        textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
        eachFieldWidth: 50.0,
        eachFieldHeight: 50.0,
        onSubmit: (String pin) => _showSnackBar(pin),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration.copyWith(color: Colors.white),
        followingFieldDecoration: pinPutDecoration,
      ),
    );
  }

  Widget justRoundedCornersPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(43, 46, 66, 1),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: const Color.fromRGBO(126, 203, 224, 1),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: PinPut(
        fieldsCount: 4,
        withCursor: true,
        textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
        eachFieldWidth: 40.0,
        eachFieldHeight: 55.0,
        onSubmit: (String pin) => _showSnackBar(pin),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration,
        pinAnimationType: PinAnimationType.fade,
      ),
    );
  }

  Widget get _bottomAppBar {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: () => _pinPutFocusNode.requestFocus(),
            child: const Text('Focus'),
          ),
          TextButton(
            onPressed: () => _pinPutFocusNode.unfocus(),
            child: const Text('Unfocus'),
          ),
          TextButton(
            onPressed: () => _pinPutController.text = '',
            child: const Text('Clear All'),
          ),
          TextButton(
            child: Text('Paste'),
            onPressed: () => _pinPutController.text = '234',
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String pin) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    // ScaffoldMessenger.of(context)
    //   ..hideCurrentSnackBar()
    //   ..showSnackBar(snackBar);
  }
}

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  RoundedButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromRGBO(25, 21, 99, 1),
        ),
        alignment: Alignment.center,
        child: Text(
          '$title',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
