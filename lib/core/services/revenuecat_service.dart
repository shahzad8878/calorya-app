
import 'package:purchases_flutter/purchases_flutter.dart';
class RevenueCatService {
  static Future<void> init() async {
    await Purchases.setLogLevel(LogLevel.debug);
    // Purchases.configure(PurchasesConfiguration("YOUR_REVENUECAT_API_KEY"));
  }
  static Future<bool> isPro() async {
    try {
      final info = await Purchases.getCustomerInfo();
      return info.entitlements.active.isNotEmpty;
    } catch (_) { return false; }
  }
  static Future<void> purchaseYearly() async {
    final offerings = await Purchases.getOfferings();
    final package = offerings.current?.annual;
    if (package != null) await Purchases.purchasePackage(package);
  }
}
