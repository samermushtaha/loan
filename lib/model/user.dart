import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class User {
  late String firstName;
  late String lastName;
  late String email;
  late String address;
  late String longitude;
  late String latitude;
  late String birthdate;
  String? image;
  String? phoneNumber;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.birthdate,
    required this.image,
    this.phoneNumber
  });

  FormData body() {
    return FormData.fromMap({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'address': address,
      'address_line1': latitude,
      'address_line2': longitude,
      'date_of_birth': birthdate,
    });
  }

  Future<FormData> body2() async{
    return await FormData.fromMap({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'address': address,
      'address_line1': latitude,
      'address_line2': longitude,
      'date_of_birth': birthdate,
      'image': image != null ? await MultipartFile.fromFile(image!, filename: image!.split('/').last) : null,
    });
  }

  User.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    birthdate = json['date_of_birth'];
    latitude = json['address_line1'];
    longitude = json['address_line2'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['date_of_birth'] = this.birthdate;
    data['address_line1'] = this.latitude;
    data['address_line2'] = this.longitude;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, email: $email, address: $address, longitude: $longitude, latitude: $latitude, birthdate: $birthdate, image: $image}';
  }
}
