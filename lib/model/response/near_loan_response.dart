class NearLoanResponse {
  late String message;
  NearLoan? data;
  late bool success;

  NearLoanResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new NearLoan.fromJson(json['data']) : null;
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

class NearLoan {
  NearCreditor? nearCreditor;
  String? deadlineCreditor;
  NearCreditor? nearDebitor;
  String? deadlineDebitor;

  NearLoan(
      {this.nearCreditor,
        this.deadlineCreditor,
        this.nearDebitor,
        this.deadlineDebitor});

  NearLoan.fromJson(Map<String, dynamic> json) {
    nearCreditor = json['near creditor'] != null
        ? new NearCreditor.fromJson(json['near creditor'])
        : null;
    deadlineCreditor = json['deadline creditor'];
    nearDebitor = json['near debitor'] != null
        ? new NearCreditor.fromJson(json['near debitor'])
        : null;
    deadlineDebitor = json['deadline debitor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nearCreditor != null) {
      data['near creditor'] = this.nearCreditor!.toJson();
    }
    data['deadline creditor'] = this.deadlineCreditor;
    data['near debitor'] = this.nearDebitor;
    data['deadline debitor'] = this.deadlineDebitor;
    return data;
  }
}

class NearCreditor {
  String? debitorPhone;
  int? amountDebt;

  NearCreditor({this.debitorPhone, this.amountDebt});

  NearCreditor.fromJson(Map<String, dynamic> json) {
    debitorPhone = json['debitor_phone'];
    amountDebt = json['amount_debt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['debitor_phone'] = this.debitorPhone;
    data['amount_debt'] = this.amountDebt;
    return data;
  }
}
