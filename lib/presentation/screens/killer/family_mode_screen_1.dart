
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
class FamilyModeScreen extends StatefulWidget {
  const FamilyModeScreen({super.key});
  @override
  State<FamilyModeScreen> createState() => _FamilyModeScreenState();
}
class _FamilyModeScreenState extends State<FamilyModeScreen> {
  double portion = 0.25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Family Mode")), body: Padding(padding: EdgeInsets.all(24), child: Column(children: [
      Icon(Icons.family_restroom, size: 60, color: AppColors.primary),
      SizedBox(height: 16),
      Text("Cooking for family?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      SizedBox(height: 24),
      TextField(decoration: InputDecoration(labelText: "Total dish", hintText: "Chicken Biryani", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      SizedBox(height: 12),
      TextField(decoration: InputDecoration(labelText: "Serves", hintText: "4 people", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      SizedBox(height: 24),
      Text("How much did YOU eat? \${(portion*100).toInt()}%"),
      Slider(value: portion, min: 0.1, max: 1.0, divisions: 10, onChanged: (v)=>setState(()=>portion=v)),
      SizedBox(height: 16),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(16)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Your portion:"), Text("\${(480*portion).toInt()} kcal", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 18))])),
      Spacer(),
      ElevatedButton(onPressed: (){}, child: Text("Add My Portion")),
    ])));
  }
}
