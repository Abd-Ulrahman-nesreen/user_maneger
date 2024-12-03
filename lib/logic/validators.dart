class Validators {
  bool isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }


  static String? emailValidator (String? enteredText){
    if (enteredText == null){
      return "email cant be empty";
    }else if (Validators().isValidEmail(enteredText)){
      return null;
    }
    return "this isn't email";
  }

  static String? passwordValidator (String? enteredText){
    if (enteredText == null){
      return "password cant be empty";
    }else if (enteredText.length > 7){
      return null;
    }
    return "this isn't password";
  }

  static String? passwordConfirmValidator (String? enteredText , String? passwordValue){
    if (enteredText == null && enteredText!.isEmpty){
      return "This cant be empty";
    } else if (enteredText == passwordValue){
      return null;
    } else {
      return "this isn't match the password";
    }
  }
}