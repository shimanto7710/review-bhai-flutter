import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'dart:convert';

import 'package:reviewbahi/network/model/models.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth;

  // DatabaseReference _databaseReference;

  FirebaseService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  // Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<Either<dynamic, UserCredential>> signIn(
      {String email, String password}) async {
    try {
      // addUser();
      // getUserData();
      // addUserById(UserModel(2,"asd"));

      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      // print(e.code);
      return Left(e.code);
    }
  }

  Future<OtpResponse> sendOtp({String phoneNumber}) async {
    print("sendOtp");

    await _firebaseAuth.verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: '+8801686352645',
      verificationCompleted: (PhoneAuthCredential credential) {
        print("verification completed");

      },
      verificationFailed: (FirebaseAuthException e) {
        print("verification failed " + e.toString());

      },
      codeSent: (String verificationId, int resendToken) {
        OtpResponse otpResponse = OtpResponse(verificationId, resendToken);
        print("verification code sent");

      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("verification timeout");

      },
    );
  }

  Future<void> _submitPhoneNumber() async {
    print("_submitPhoneNumber");

    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+8801686352645";
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more readable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
    }

    void verificationFailed(FirebaseAuthException error) {
      print("error");
      print(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `milliseconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }
}
