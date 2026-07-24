
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryDark], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SafeArea(child: Padding(padding: EdgeInsets.all(24), child: Column(children: [
          Align(alignment: Alignment.topRight, child: IconButton(icon: Icon(Icons.close, color: Colors.white), onPressed: (){})),
          Icon(Icons.workspace_premium, size: 80, color: Colors.white),
          SizedBox(height: 16),
          Text("Unlock Calorya Pro", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          Text("Eat Smart. Scan Anything.", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 32),
          _FeatureRow(icon: Icons.camera_alt, text: "Unlimited AI Food Scans"),
          _FeatureRow(icon: Icons.qr_code_scanner, text: "Unlimited Barcode Scans"),
          _FeatureRow(icon: Icons.restaurant_menu, text: "Restaurant Menu Scanner"),
          _FeatureRow(icon: Icons.family_restroom, text: "Family Mode + Meal Suggestions"),
          Spacer(),
          _PlanCard(title: "Yearly", price: "\$39.99", subtitle: "\$3.33/mo - BEST VALUE", isBest: true),
          SizedBox(height: 12),
          _PlanCard(title: "Monthly", price: "\$7.99", subtitle: "Billed monthly", isBest: false),
          SizedBox(height: 16),
          ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary), child: Text("Start 7-Day Free Trial")),
          SizedBox(height: 8),
          Text("Cancel anytime. 7-day free trial.", style: TextStyle(color: Colors.white70, fontSize: 12)),
        ]))),
      ),
    );
  }
}
class _FeatureRow extends StatelessWidget {
  final IconData icon; final String text;
  const _FeatureRow({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) => Padding(padding: EdgeInsets.symmetric(vertical: 6), child: Row(children: [Icon(icon, color: Colors.white, size: 20), SizedBox(width: 12), Text(text, style: TextStyle(color: Colors.white))]));
}
class _PlanCard extends StatelessWidget {
  final String title, price, subtitle; final bool isBest;
  const _PlanCard({required this.title, required this.price, required this.subtitle, required this.isBest});
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: isBest ? Colors.white : Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(16), border: isBest ? Border.all(color: Colors.yellow, width: 2) : null), child: Row(children: [
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isBest ? AppColors.primary : Colors.white)), Text(subtitle, style: TextStyle(fontSize: 12, color: isBest ? Colors.grey : Colors.white70))])),
      Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: isBest ? AppColors.primary : Colors.white)),
    ]));
  }
}
