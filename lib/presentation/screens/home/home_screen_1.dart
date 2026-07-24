
import 'package:flutter/material.dart';
import '../../widgets/calorie_ring.dart';
import '../../../core/constants/app_colors.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text("Today"), actions: [IconButton(icon: Icon(Icons.notifications_none), onPressed: (){})]),
      body: SingleChildScrollView(padding: EdgeInsets.all(16), child: Column(children: [
        CalorieRing(consumed: 480, target: 2200, burned: 150),
        SizedBox(height: 16),
        _MealSection(title: "Breakfast", kcal: 0, target: 550, color: AppColors.breakfast),
        _MealSection(title: "Lunch", kcal: 480, target: 700, color: AppColors.lunch),
        _MealSection(title: "Dinner", kcal: 0, target: 700, color: AppColors.dinner),
        _MealSection(title: "Snacks", kcal: 0, target: 250, color: AppColors.snacks),
      ])),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, backgroundColor: AppColors.primary, icon: Icon(Icons.add), label: Text("Add Food")),
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed, selectedItemColor: AppColors.primary, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Scan"),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Analytics"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ]),
    );
  }
}
class _MealSection extends StatelessWidget {
  final String title; final double kcal, target; final Color color;
  const _MealSection({required this.title, required this.kcal, required this.target, required this.color});
  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(padding: EdgeInsets.all(16), child: Row(children: [
      Container(width: 4, height: 40, color: color),
      SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text("\${kcal.toInt()}/\${target.toInt()} kcal", style: TextStyle(color: Colors.grey)),
      ])),
      ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)), child: Text("+ Add")),
    ])));
  }
}
