class VerificationCodeResponse {
  late String message;
  late int data;
  late bool success;

  VerificationCodeResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    data['success'] = this.success;
    return data;
  }
}