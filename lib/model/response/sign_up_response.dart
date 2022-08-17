import '../user.dart';

class SignUpResponse {
  late String message;
  User? data;
  late bool success;

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
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
  late String firstName;
  late String lastName;
  late String email;
  late String address;
  late String longitude;
  late String latitude;
  late String birthdate;
  late String image;
  String? phoneNumber;

  Data.fromJson(Map<String, dynamic> json) {
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
}
