int dispenseItem(String code, double cash) {
  List<String> validCodes = ['A1', 'B2', 'C3'];
  bool found = false;

  for (int i = 0; i < validCodes.length; i++) {
    if (validCodes[i] == code) {
      found = true;
    }
  }

  if (!found) {
    throw FormatException("Invalid item selection code!");
  }

  if (cash >= 50.0) {
    print("Dispensing item $code. Enjoy your snack!");
    return (cash - 50.0).toInt();
  } else {
    print("Insufficient funds. Item costs 50 coins.");
    return cash.toInt();
  }
}

void main() {
  String inputCode = 'A1';
  String rawPayment = '60.0';

  try {
    double inputPayment = double.parse(rawPayment);
    int change = dispenseItem(inputCode, inputPayment);
    print("Change returned: $change coins.");
  } catch (e) {
    print("Transaction Failed: ${e.toString()}");
  }
}
