dynamic validateEmail(String email) {
  final RegExp exp =
      RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
  if (exp.allMatches(email).length > 0) {
    return null;
  } else {
    return 'Enter a valid email';
  }
}

dynamic validatePassword(String password) {
  final RegExp exp = new RegExp(
      r"^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$");
  if (exp.allMatches(password).length > 0) {
    return null;
  } else {
    return 'Password must be alphanumeric, 8 characters long';
  }
}

dynamic validateName(String name) {
  final RegExp exp = new RegExp('[A-Za-z]{2,25}( [A-Za-z]{2,25})?');
  if (exp.allMatches(name).length > 0) {
    return null;
  } else {
    return 'Invalid name';
  }
}
