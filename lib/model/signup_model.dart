// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUp {
  String name;
  String email;
  String password;
  String phoneNumber;
  String image;
  DateTime dateOfBirth;
  SignUp({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.image,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'image': image,
      'Birthday Date': dateOfBirth,
    };
  }

  factory SignUp.fromMap(Map<String, dynamic> map) {
    return SignUp(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      image: map['image'] as String,
      dateOfBirth: map['dateOfBirth'] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUp.fromJson(String source) => SignUp.fromMap(json.decode(source) as Map<String, dynamic>);

  SignUp copy({ required DateTime? dateOfBirth})=>
      SignUp(
        name: name,
        email: email,
        password: password,
        dateOfBirth: dateOfBirth!, 
        image: image,
        phoneNumber: phoneNumber, 
      );
}
