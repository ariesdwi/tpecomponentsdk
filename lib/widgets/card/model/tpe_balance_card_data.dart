class TpeBalanceCardData {
  final String accountNumber;
  final String currency;
  final double currentBalance;
  final bool isLoading;
  final bool showCopy;
  final String? copyTitleText;
  final String? titleBalanceText;
  final String? copySuccessMessage;
  final String? copyErrorMessage;

  const TpeBalanceCardData({
    required this.accountNumber,
    required this.currency,
    required this.currentBalance,
    this.showCopy = false,
    this.copyTitleText,
    this.titleBalanceText,
    this.copyErrorMessage,
    this.isLoading = false,
    this.copySuccessMessage,
  });
}