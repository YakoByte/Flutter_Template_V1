String? validateEmail(String value) {
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w- ]{2,4}$';
  final regExp = RegExp(pattern);

  if (value.isEmpty) {
    return "Please Enter your Email ID";
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter valid email';
  } else {
    return null;
  }
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Please Enter password';
  } else if (value.length < 6) {
    return 'Password must be 6 characters long';
  } else {
    return null;
  }
}

String? validateConfirmPassword(String confirmpass, String pass) {
  if (confirmpass.isEmpty) {
    return 'Please Enter Confirm password';
  } else if (confirmpass.length < 6) {
    return 'Password must be at least 6 characters long';
  } else if (confirmpass != pass) {
    return 'Password must be same as above';
  } else {
    return null;
  }
}

String? validateUname(String value) {
  if (value.isEmpty) {
    return "Please Enter Your User Name";
  } else {
    return null;
  }
}

String? validate(String value) {
  if (value.isEmpty) {
    return "Required*";
  } else {
    return null;
  }
}

String? validatephone(String value) {
  if (value.isEmpty) {
    return "Please Enter Your Phone No.";
  } else if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\/0-9]+$')
      .hasMatch(value)) {
    return "Please Enter Valid Phone No.";
  }
  if (value.length != 10) {
    return 'Phone No. must be at least 10 characters long';
  } else {
    return null;
  }
}
