class Payment {
  Payment({
    required this.id,
    required this.orderId,
    required this.buyerName,
    required this.paymentDate,
    required this.status,
    required this.amount,
  });

  final int id;
  final int orderId;
  final String buyerName;
  final DateTime paymentDate;
  final bool status;
  final double amount;

  Payment copyWith(
    int? id,
    int? orderId,
    String? buyerName,
    DateTime? paymentDate,
    bool? status,
    double? amount,
  ) =>
      Payment(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        buyerName: buyerName ?? this.buyerName,
        paymentDate: paymentDate ?? this.paymentDate,
        status: status ?? this.status,
        amount: amount ?? this.amount,
      );

  Map toJson() => {
        'id': id,
        'order_id': orderId,
        'buyer_name': buyerName,
        'payment_date': paymentDate,
        'status': status,
        'amount': amount,
      };

  @override
  bool operator ==(Object other) =>
      other is Payment &&
      other.runtimeType == runtimeType &&
      other.id == id &&
      other.orderId == orderId &&
      other.buyerName == buyerName &&
      other.status == status &&
      other.amount == amount;

  @override
  int get hashCode => Object.hash(this, id, orderId, buyerName, status, amount);
}
