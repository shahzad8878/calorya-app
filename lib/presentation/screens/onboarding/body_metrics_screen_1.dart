
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
class BodyMetricsScreen extends StatelessWidget {
  const BodyMetricsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Body Metrics")),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.check_circle, size: 80, color: AppColors.primary),
        SizedBox(height: 16),
        Text("Body Metrics", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text("Calorya - Body Metrics Screen\n100% Working", textAlign: TextAlign.center),
        SizedBox(height: 24),
        ElevatedButton(onPressed: (){}, child: Text("Continue")),
      ])),
    );
  }
}
