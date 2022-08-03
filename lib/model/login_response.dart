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
  String? token;
  Null? draft;

  Data({this.token, this.draft});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    draft = json['draft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['draft'] = this.draft;
    return data;
  }
}
