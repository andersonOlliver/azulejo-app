class LoginEmail {
  final String email;
  final String password;

  LoginEmail({required this.email, required this.password});

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  factory LoginEmail.fromEmailAndPassword(String email, String password) =>
      LoginEmail(email: email, password: password);

  Map<String, String> toJson() => {'email': email, 'password': password};

  @override
  String toString() {
    return 'Email: $email, Password: $password';
  }
}
