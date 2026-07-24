
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
class WhatToEatScreen extends StatelessWidget {
  const WhatToEatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("What Should I Eat Now?")), body: Padding(padding: EdgeInsets.all(16), child: Column(children: [
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(16)), child: Row(children: [Icon(Icons.lightbulb, color: AppColors.primary), SizedBox(width: 12), Expanded(child: Text("You have 650 kcal left for dinner", style: TextStyle(fontWeight: FontWeight.bold)))])),
      SizedBox(height: 16),
      Card(child: Padding(padding: EdgeInsets.all(16), child: Column(children: [
        Row(children: [Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(12)), child: Icon(Icons.restaurant, color: Colors.orange)), SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Chicken Tikka + Roti + Raita", style: TextStyle(fontWeight: FontWeight.bold)), Text("Perfect Fit! High protein", style: TextStyle(color: AppColors.success, fontSize: 12))]))]),
        SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Text("620 kcal"), Text("42g protein"), Text("Halal")]),
        SizedBox(height: 12),
        ElevatedButton(onPressed: (){}, child: Text("Add This Meal")),
      ]))),
    ])));
  }
}
