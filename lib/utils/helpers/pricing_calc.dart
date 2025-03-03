class PricingCalc {
  static double calculateTotalPrice(double price, String locatin) {
    double taxRate = getTaxRate(locatin);
    double taxAmount = price * taxRate;
    double shippingCost = getShippingCost(locatin);
    double totalPrice = price + taxAmount + shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(String location, double price) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTaxAmount(String location, double price) {
    double taxRate = getTaxRate(location);
    double taxAmount = price * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRate(String location) {
    // add more locations
    return 0.14;
  }

  static double getShippingCost(String location) {
    // add more locations
    return 50.0;
  }
}
