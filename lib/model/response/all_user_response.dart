class AllUserResponse {
  late String message;
  late List<UserCard> data;
  late bool success;

  AllUserResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <UserCard>[];
      json['data'].forEach((v) {
        data.add(new UserCard.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class UserCard {
  late String phoneNumber;
  String? firstName;
  String? lastName;
  String? image;

  UserCard({required this.phoneNumber, required this.lastName, required this.firstName, required this.image});

  UserCard.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    // fullName = json['Full name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['Full name'] = this.firstName;
    data['image'] = this.image;
    return data;
  }
}
