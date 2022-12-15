import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

////////CONNECTION WITH FIREBASE////////
final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

/// **************************SIGN IN*****************************************/
Future signInWithEmailAndPassword(String email, String password) async {
  final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email.trim(),
    password: password.trim(),
  ))
      .user;

  userId = user!.uid;
  print('LOG IN WITH USER ID:  $userId');
}

/// **************************SIGN UP*****************************************/
Future createUserWithEmailAndPassword(String email, String password) async {
  User? newUser = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email.trim(),
    password: password.trim(),
  ))
      .user;

  addUserDetails(newUser!.uid, 'usernameHere', email.trim(), password.trim(),
      'phoneNumberHere', 'imageUrlHere');
}

/// **************************ADD USER DETAILS*****************************************/
Future addUserDetails(String userId, String userName, String userEmail,
    String userPassword, String userPhoneNumber, String userImage) async {
  //2. ADD USER DOC IN "USERS" COLLECTION AND UPDATE THE USER ID***************/
  await FirebaseFirestore.instance.collection('users').doc(userId).set({
    'id': userId,
    'Name': userName,
    'Email': userEmail,
    'Password': userPassword,
    'Phone Number': int.parse(userPhoneNumber),
    'Image': userImage,
  });

  print('NEW USER REGISTERED WITH ID: $userId');

  //3. OPTIONAL: SAVE USER ID LOCALLY FOR LATER USE****************************/
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('USER_ID', userId);
}

/// **************************UPDATE USER DETAILS*****************************************/
Future updateUserDetails(String userName, String userEmail,
    String userPhoneNumber, String userImage) async {
  print('TRYING TO UPDATE USER DETAILS WITH ID: $userId');

  final updateUser = FirebaseFirestore.instance.collection('users').doc(userId);
  updateUser.update(
    {
      'Name': userName.trim(),
      'Email': userEmail.trim(),
      'Phone Number': int.parse(userPhoneNumber.trim()),
      'Image': userImage,
    },
  );
}