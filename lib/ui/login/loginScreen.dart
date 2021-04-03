import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/detail_info/detail_info_screen.dart';
import 'package:reviewbahi/ui/home/home.dart';
import 'package:reviewbahi/ui/login_pin/InputPinScreen.dart';


import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {

  static const routeName = '/login';

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _bloc;
  var screenWidth;
  TextEditingController inputNumberController;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    _bloc = new LoginBloc();
    inputNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    //Close the Stream Sink when the widget is disposed
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<LoginBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (BuildContext context, LoginState state) {
            // ignore: missing_return
          },
          // ignore: missing_return
          builder: (BuildContext context, LoginState state) {
            return SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height/10,),
                      Container(
                        margin: EdgeInsets.only(right: screenWidth / 5),
                        child: SvgPicture.asset("assets/icons/otp_send.svg"),
                      ),
                      Container(
                        child: Text(
                          "OTP Verification",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'we will send you an',
                                  style: TextStyle(fontSize: 15)),
                              TextSpan(
                                  text: ' One Time Password',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '\non this mobile number',
                                  style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: CustomColors.primaryColor,
                                        width: 3)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: double.maxFinite,
                                      alignment: Alignment.center,
                                      color: CustomColors.primaryColor,
                                      child: Text(
                                        "+88",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 6),
                                        child: TextFormField(
                                          onChanged: (text) {},
                                          controller: inputNumberController,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          style: TextStyle(
                                              color: CustomColors.primaryColor,
                                              fontSize: 20),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              (state is OtpErrorState)
                                  ? Container(
                                      child: Text(
                                      state.msg,
                                      style: TextStyle(
                                          color: CustomColors.primaryColor),
                                    ))
                                  : Container(),
                              Container(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 45,
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.primaryColor
                                          .withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],

                                  // border: Border.all(
                                  //     color: CustomColors.primaryColor, width: 3),
                                ),
                                child: (state is LoadingState)
                                    ? MaterialButton(
                                        shape: RoundedRectangleBorder(

                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        color: CustomColors.primaryColor,
                                        onPressed: () {
                                          _bloc.add(SendOtpEvent());
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                backgroundColor:
                                                    Colors.redAccent,
                                                valueColor:
                                                    AlwaysStoppedAnimation(
                                                        Colors.white),
                                                strokeWidth: 5,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Please Wait",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    : MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        color: CustomColors.primaryColor,
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            var isValidate =
                                                _phoneNumberValidator(
                                                    inputNumberController.text
                                                        .toString());
                                            if (!isValidate) {
                                              _bloc.add(ErrorEvent(
                                                  msg:
                                                      "Please use a valid number"));
                                            } else {
                                              sendOtp(
                                                  phoneNumber:
                                                      inputNumberController.text
                                                          .toString());
                                              _bloc.add(SendOtpEvent());
                                            }
                                          }
                                        },
                                        child: Text(
                                          "GET OTP",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 30),
                        child: GestureDetector(
                          onTap: (){
                            _dummyDestination();
                          },
                          child: Text(
                            'Login with Gmail',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // void _onClickSignUp() {
  //   Navigator.of(context).pushNamed(Signup.routeName);
  // }

  VoidCallback sendOtp({String phoneNumber}) {
    print("sendOtp");

    _firebaseAuth.verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: '+88$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {
        print("verification completed");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("verification failed " + e.toString());
      },
      codeSent: (String verificationId, int resendToken) {
        _onClickLogin(verificationId,resendToken,"+88$phoneNumber");
        print("verification code sent");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("verification timeout");
      },
    );
  }

  bool _phoneNumberValidator(String value) {
    Pattern pattern = r'^(?:\+88|01)?\d{11}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  _onClickLogin(String verificationId, int resendToken, String phoneNumber) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PinPutView(verificationId: verificationId,resendToken: resendToken,phoneNumber: phoneNumber),
        ));
  }

  _dummyDestination() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailInfoScreen(),
        ));
  }



}
