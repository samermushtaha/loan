import 'package:loan_app/model/response/all_user_response.dart';

class FilterUserResponse {
  String? message;
  List<UserCard>? data;
  bool? success;

  FilterUserResponse({this.message, this.data, this.success});

  FilterUserResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <UserCard>[];
      json['data'].forEach((v) {
        data!.add(new UserCard.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}
//
// class Data {
//   String? phoneNumber;
//   String? firstName;
//   String? lastName;
//   String? image;
//
//   Data({this.phoneNumber, this.firstName, this.lastName, this.image});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     phoneNumber = json['phone_number'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     image = json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['phone_number'] = this.phoneNumber;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['image'] = this.image;
//     return data;
//   }
// }
