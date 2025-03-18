enum TransactionStausEnum {
  pending(1),
  success(2),
  failure(3);

  final int id;

  const TransactionStausEnum(this.id);
}
