class Transaction{
  late String payerPhone;
  late String recipientPhone;
  late int amount;
  late String createdAt;
  List<Transaction>? list;

  Transaction({required this.payerPhone, required this.recipientPhone, required this.amount, required this.createdAt});

  Transaction.fromJson(Map<String, dynamic> json) {
    payerPhone = json['payer_phone'];
    recipientPhone = json['recipient_phone'];
    amount = json['amount'];
    createdAt = json['created_at'];
  }
}