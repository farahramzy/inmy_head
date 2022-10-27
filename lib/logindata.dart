class LoginData {
  String username = '';
  static String password = '';
  String firstName = '';
  String lastName = '';
  // Map<String, bool> interests = {
  //   reading: false,
  //   chess: false,
  //   traveling: false
  // };

  save() {
    //code to save to database or server
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
