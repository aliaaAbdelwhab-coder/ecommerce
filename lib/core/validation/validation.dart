class Validation {
static  String? validationName(String? name ) {
    if (name == null || name.trim().isEmpty) {
      return "please enter name ";
    }
    return null;
  }

static  String? validationEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return "please enter email ";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return "please enter valid email";
    }
    return null;
  }

static  String? validationPassword(String ?password ) {
    if (password == null || password.trim().isEmpty) {
      return "please enter password ";
    }
    if (password.length < 6) {
      return "password should be at least 6 characters";
    }
    return null;
  }

static  String? validationRepassword(String? rePassword , String ?Password) {
    if (rePassword == null || rePassword.trim().isEmpty) {
      return "please enter password ";
    }
    if (rePassword.length < 6) {
      return "password should be at least 6 characters";
    }
    if (rePassword != Password) {
      return "re password dosnot match password";
    }
    return null;
  }

static  String? validationPhone(String ?phone ) {
    if (phone == null || phone.trim().isEmpty) {
      return "please enter Phone number";
    }
    if (phone.length !=11) {
      return "Phone number should be  11 number";
    }
    return null;
  }
}
