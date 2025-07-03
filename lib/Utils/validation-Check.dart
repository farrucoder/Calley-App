import 'package:flutter/material.dart';

import '../Reusable-Widgets/custom-Toast.dart';

class ValidationCheck{

  static bool isFormValidLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email.isEmpty || password.isEmpty) {
      showCustomToast(context, 'Please fill all the fields.');
      return false;
    }

    if (!emailRegExp.hasMatch(email)) {
      showCustomToast(context, 'Please enter a valid email address.');
      return false;
    }

    return true;
  }


 static bool isFormValidSignup({
    required String email,
    required String password,
    required String name,
    required String number,
    required BuildContext context,
  }) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email.isEmpty || password.isEmpty || name.isEmpty || number.isEmpty) {

      showCustomToast(context, 'Please fill all the fields.');

      return false;
    }else if(password.length < 8){

      showCustomToast(context, 'Password should minimum 8 digit.');
      return false;
    }

    if (!emailRegExp.hasMatch(email)) {
      showCustomToast(context, 'Please enter a valid email address.');
      return false;
    }

    return true;
  }



}