
class OtpResponse{
  bool status;
  String verificationId;
  int resendToken;

  OtpResponse(this.verificationId, this.resendToken);
}