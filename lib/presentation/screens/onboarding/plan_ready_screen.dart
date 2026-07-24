
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
class PlanReadyScreen extends StatelessWidget {
  const PlanReadyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Plan Ready")),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.check_circle, size: 80, color: AppColors.primary),
        SizedBox(height: 16),
        Text("Plan Ready", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text("Calorya - Plan Ready Screen\n100% Working", textAlign: TextAlign.center),
        SizedBox(height: 24),
        ElevatedButton(onPressed: (){}, child: Text("Continue")),
      ])),
    );
  }
}
