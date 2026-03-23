class InsufficientBalanceException implements Exception {
  final String message;

  const InsufficientBalanceException({required this.message});

  @override
  String toString() => message;
}
