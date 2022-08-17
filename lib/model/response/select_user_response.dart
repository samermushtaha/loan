class SelectUserResponse {
  String? message;
  Dataa? data;
  bool? success;

  SelectUserResponse({this.message, this.data, this.success});

  SelectUserResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Dataa.fromJson(json['data']) : null;
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

class Dataa {
  int? amount;
  String? deadline;
  User? user;

  Dataa({this.amount, this.deadline, this.user});

  Dataa.fromJson(Map<String, dynamic> json) {
    amount = json['amount '];
    deadline = json['deadline'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount '] = this.amount;
    data['deadline'] = this.deadline;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? image;

  User({this.phoneNumber, this.firstName, this.lastName, this.image});

  User.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    return data;
  }
}
