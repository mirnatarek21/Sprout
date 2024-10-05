class EmailValidator {
  static String? validate(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z]+\.[a-zA-Z]{2,3}$');

    if (emailRegex.hasMatch(email)) {
      return null; // Valid email
    } else {
      return "Please enter a valid email in the format: ***@***.***";
    }
  }
}
