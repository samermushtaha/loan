import 'package:dio/dio.dart';

class User {
  late String firstName;
  late String lastName;
  late String email;
  late String address;
  // late String birthdate;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    // required this.birthdate,
  });

  FormData body() {
    return FormData.fromMap({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'address': address,
      // 'birthdate': birthdate,
    });
  }
}
