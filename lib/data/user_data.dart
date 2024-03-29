// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// *********************CONNECTION WITH FIREBASE******************************/
final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

/// *********************CONNECTION WITH FIREBASE******************************/

class UserData {
  Stream<DocumentSnapshot> getUserDetails() {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userIds)
        .snapshots();
  }

  /// **************************GET USER ROLE**********************************/
  Future<Object> getUserRole() async {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userIds).get();
    return documentSnapshot;
  }

  /// **************************SIGN IN****************************************/
  Future signInWithEmailAndPassword(String email, String password) async {
    final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    ))
        .user;
    if (user != null) {
      userId = user.uid;
    }
  }

  /// **************************SIGN UP******************************************/
  Future createUserWithEmailAndPassword(String email, String password) async {
    User? newUser = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    ))
        .user;

    addUserDetails(newUser!.uid, 'usernameHere', email.trim(), password.trim(),
        'phoneNumberHere', 'selectedDT', 'imageUrlHere', 'user');
  }

  /// **************************ADD USER DETAILS*********************************/
  Future addUserDetails(
      String userId,
      String userName,
      String userEmail,
      String userPassword,
      String userPhoneNumber,
      String selectedDT,
      String userImage,
      String userRole) async {
    //2. ADD USER DOC IN "USERS" COLLECTION AND UPDATE THE USER ID***************/
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'id': userId,
      'Name': userName,
      'Email': userEmail,
      'Password': userPassword,
      'Phone Number': int.parse(userPhoneNumber),
      'date_time': selectedDT,
      'Image': userImage,
      'userRole': userRole
    });

    //3. OPTIONAL: SAVE USER ID LOCALLY FOR LATER USE****************************/
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('USER_ID', userId);
  }

  /// **************************UPDATE USER DETAILS******************************/
  Future updateUserDetails(String userName, String userEmail,
      String userPhoneNumber, String? userImage) async {
    final updateUser =
        FirebaseFirestore.instance.collection('users').doc(userId);
    updateUser.update(
      {
        'Name': userName.trim(),
        'Email': userEmail.trim(),
        'Phone Number': int.parse(userPhoneNumber.trim()),
        'Image': userImage,
      },
    );
  }

  Future<bool> updateEmail(String? newEmail) async {
    // Add your function code here!
    if ((FirebaseAuth.instance.currentUser != null) && (newEmail != null)) {
      try {
        await FirebaseAuth.instance.currentUser!.updateEmail(newEmail);
      } on FirebaseAuthException catch (e) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }
}
