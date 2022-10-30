class LoginModel {
  String username = 'Farah';
  String password = '12345';

  save() {
    print('saving user data');
    print('$username $password');
    if (username.isNotEmpty) {
      print(username);
    }

    if (password.isNotEmpty) {
      print(password);
    }
  }
}
