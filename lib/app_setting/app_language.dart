import 'package:get/get.dart';

class AppLanguage extends Translations{

  @override
  Map<String, Map<String, String>> get keys => {
    'en' : {
      //********************** OutBoardingScreen **********************//
      'outBoardingTitle1' : 'Get Access To Quick Loans',
      'outBoardingSubTitle1' : 'Easily get access to loans using your phone',
      'outBoardingTitle2' : 'Easy & Convenient',
      'outBoardingSubTitle2' : 'No guarantors, No long queues, No paper',
      'outBoardingTitle3' : 'Track Everything',
      'outBoardingSubTitle3' : 'Your financial journey start here',
      'start' : 'Get Started',
      //********************** SignInScreen **********************//
      'signIn' : 'Sign In',
      'enterPhone' : 'Enter your phone number',
      'continue' : 'Continue',

      //********************** VerificationCodeScreen **********************//
      'verificationAppBar' : 'Verification code',
      'verificationTitle' : 'We sent OTP code to verify your number',
      'notReceived' : 'Not received code ? ',
      'resent' : 'Resend',


    },
    'ar' : {
      '' : '',
    }
  };

}