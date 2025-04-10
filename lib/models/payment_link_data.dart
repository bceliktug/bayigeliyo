class PaymentLinkData {
  final String name;
  final String email;
  final String phone;
  final double amount;
  final String currency;
  final String amountType;
  final String linkType;
  final DateTime? linkExpiryDate;
  final bool contactInfoRequired;
  final bool invoiceRequired;
  final bool descriptionRequired;
  final String paymentType;
  final String selectedPos;
  final double? limitAmount;

  PaymentLinkData({
    required this.name,
    required this.email,
    required this.phone,
    required this.amount,
    required this.currency,
    required this.amountType,
    required this.linkType,
    this.linkExpiryDate,
    required this.contactInfoRequired,
    required this.invoiceRequired,
    required this.descriptionRequired,
    required this.paymentType,
    required this.selectedPos,
    this.limitAmount,
  });

  PaymentLinkData copyWith({
    String? name,
    String? email,
    String? phone,
    double? amount,
    String? currency,
    String? amountType,
    String? linkType,
    DateTime? linkExpiryDate,
    bool? contactInfoRequired,
    bool? invoiceRequired,
    bool? descriptionRequired,
    String? paymentType,
    String? selectedPos,
    double? limitAmount,
  }) {
    return PaymentLinkData(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      amountType: amountType ?? this.amountType,
      linkType: linkType ?? this.linkType,
      linkExpiryDate: linkExpiryDate ?? this.linkExpiryDate,
      contactInfoRequired: contactInfoRequired ?? this.contactInfoRequired,
      invoiceRequired: invoiceRequired ?? this.invoiceRequired,
      descriptionRequired: descriptionRequired ?? this.descriptionRequired,
      paymentType: paymentType ?? this.paymentType,
      selectedPos: selectedPos ?? this.selectedPos,
      limitAmount: limitAmount ?? this.limitAmount,
    );
  }
}
