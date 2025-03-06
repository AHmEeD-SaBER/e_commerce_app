import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  String get fullName => '$firstName $lastName';
  static List<String> nameParts(String fullName) => fullName.split(' ');

  String get formattedPhoneNumber => Formatter.formatPhoneNumber(phoneNumber);

  static String generatedUsername(fullname) {
    List<String> nameparts = fullname.split(" ");

    return 'user_${nameparts[0].toLowerCase() + (nameparts.length > 1 ? nameparts.sublist(1).join(' ') : '')}';
  }

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
      );

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
      );
    }
    throw Exception('Document data is null');
  }

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
  });
}
