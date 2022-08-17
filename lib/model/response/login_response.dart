import '../user.dart';

class LoginResponse {
  late String message;
  Data? data;
  late bool success;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  late String token;
  late int draft;
  User? user;

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    draft = json['draft'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['draft'] = this.draft;
    return data;
  }
}

class Userss {
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? email;
  String? dateOfBirth;
  String? addressLine1;
  String? addressLine2;
  String? address;
  String? image;

  Userss(
      {this.phoneNumber,
        this.firstName,
        this.lastName,
        this.email,
        this.dateOfBirth,
        this.addressLine1,
        this.addressLine2,
        this.address,
        this.image});

  Userss.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['date_of_birth'] = this.dateOfBirth;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }
}
