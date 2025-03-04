import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNumber => Formatter.formatPhoneNumber(phoneNumber);

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      phoneNumber: '',
      password: '');

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() != null) {
      final data = doc.data()!;
      return UserModel(
        id: doc.id,
        firstName: data['firstName'],
        lastName: data['lastName'],
        userName: data['userName'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        password: data['password'],
      );
    }
    throw Exception('Document data is null');
  }

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.password});
}
