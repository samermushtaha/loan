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
      'login' : 'Login',

      //********************** VerificationCodeScreen **********************//
      'verificationAppBar' : 'Verification code',
      'verificationTitle' : 'We sent OTP code to verify your number',
      'notReceived' : 'Not received code ? ',
      'resent' : 'Resend',
      'confirm' : 'Confirm',

      //********************** SignUpScreen **********************//
      'sign_up_title' : 'Setup your account',
      'first_name' : 'First name',
      'last_name' : 'Last name',
      'birthdate' : 'Birthdate',
      'email' : 'Email',
      'address' : 'Address',
      'sign_up' : 'Sign Up',
      'select_address' : 'Select location',
      'save' : 'Save',

      //********************** HomeScreen **********************//
      'welcome' : '     Welcome, ',
      'home' : 'Home',
      'dr' : 'Dr',
      'cr' : 'Cr',
      'view_all' : 'More',
      'users' : 'Users',

      //********************** ProfileScreen **********************//
      'profile' : 'Profile',
      'profile_item_1' : 'Personal Details',
      'profile_item_2' : 'Debtors and credtors',
      'profile_item_3' : 'Setting',
      'profile_item_4' : 'Log Out',
      'edit_profile' : 'Edit profile',

      //********************** AllUsersScreen **********************//
      'all_users' : 'Users',
      'search' : 'Search. . .',
      'all_user' : 'All User',

      //********************** AddLoanScreen **********************//
      'request_loan' : 'Request loan',
      'request' : 'Request',
      'phone_number' : 'Phone Number',
      'deadline' : 'Deadline',
      'amount' : 'Amount',
      'note' : 'Note',
      'note_hint' : 'write note...',

      //********************** LoanDetailsScreen **********************//
      'loan' : 'Loan',
      'transaction' : 'Transaction',
      'pay' : 'Pay Now',

      //********************** NotificationScreen **********************//
      'notification' : 'Notification',

      //********************** SettingScreen **********************//
      'setting' : 'Setting',
      'setting_item_1' : 'Language',
      'setting_item_2' : 'Theme',
      'system_default' : 'System default',
      'light' : 'Light',
      'dark' : 'Dark',
      'arabic' : 'العربية',
      'english' : 'English',

      //********************** UserInfoScreen **********************//
      'name' : 'Name',
      'phone' : 'Phone number',
      'location' : 'Location',
    },
    'ar' : {
      //********************** OutBoardingScreen **********************//
      'outBoardingTitle1' : 'Get Access To Quick Loans',
      'outBoardingSubTitle1' : 'Easily get access to loans using your phone',
      'outBoardingTitle2' : 'Easy & Convenient',
      'outBoardingSubTitle2' : 'No guarantors, No long queues, No paper',
      'outBoardingTitle3' : 'Track Everything',
      'outBoardingSubTitle3' : 'Your financial journey start here',
      'start' : 'ابدا',
      //********************** SignInScreen **********************//
      'signIn' : 'تسجيل الدخول',
      'enterPhone' : 'ادخل رقم الجوال',
      'continue' : 'التالي',
      'login' : 'دخول',

      //********************** VerificationCodeScreen **********************//
      'verificationAppBar' : 'رمز التحقق',
      'verificationTitle' : 'تم ارسال رقم التحقق الى رقم الجوال',
      'notReceived' : 'لم استلم الرمز? ',
      'resent' : 'اعادة الارسال',
      'confirm' : 'تاكيد',

      //********************** SignUpScreen **********************//
      'sign_up_title' : 'انشاء حساب جديد',
      'first_name' : 'اسمك',
      'last_name' : 'اسم العائلة',
      'birthdate' : 'تاريخ الميلاد',
      'email' : 'البريد الالكتروني',
      'address' : 'العنوان',
      'sign_up' : 'تسجيل',
      'select_address' : 'حدد موقعك',

      //********************** HomeScreen **********************//
      'welcome' : '     مرحبا, سامر',
      'home' : 'الرئيسية',
      'dr' : 'الدائن',
      'cr' : 'المدين',
      'view_all' : 'المزيد',
      'users' : 'المستخدمين',

      //********************** ProfileScreen **********************//
      'profile' : 'الصفحة الشخصية',
      'profile_item_1' : 'بيانات الشخصية',
      'profile_item_2' : 'الدائن و المدين',
      'profile_item_3' : 'الاعدادات',
      'profile_item_4' : 'تسجيل الخروج',
      'edit_profile' : 'تعديل الحساب',

      //********************** AllUsersScreen **********************//
      'all_users' : 'المستخدمين',
      'search' : 'بحث . . .',

      //********************** AddLoanScreen **********************//
      'request_loan' : 'طلب دين',
      'request' : 'طلب',
      'phone_number' : 'رقم الجوال',
      'deadline' : 'موعد التسليم',
      'amount' : 'المبلغ',
      'note' : 'ملاحظات',
      'note_hint' : 'اكتب ملاحظاتك...',

      //********************** LoanDetailsScreen **********************//
      'loan' : 'الدين',
      'transaction' : 'الحركات',
      'pay' : 'ادفع الان',

      //********************** NotificationScreen **********************//
      'notification' : 'الاشعارات',

      //********************** SettingScreen **********************//
      'setting' : 'الاعدادات',
      'setting_item_1' : 'اللغة',
      'setting_item_2' : 'المظهر',
      'system_default' : 'الوضع الافتراضي للنظام',
      'light' : 'فاتح',
      'dark' : 'داكن',
      'arabic' : 'العربية',
      'english' : 'English',

      //********************** UserInfoScreen **********************//
      'name' : 'الاسم',
      'phone' : 'رقم الجوال',
      'location' : 'العنوان',
    }
  };

}