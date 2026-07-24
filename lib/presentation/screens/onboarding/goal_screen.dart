
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(padding: EdgeInsets.all(24), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What's your goal?", style: Theme.of(context).textTheme.displayLarge),
          SizedBox(height: 24),
          _GoalCard(title: "Lose Weight", subtitle: "Shed fat and get lean", icon: Icons.trending_down, color: AppColors.error),
          _GoalCard(title: "Maintain", subtitle: "Stay fit and healthy", icon: Icons.balance, color: AppColors.primary),
          _GoalCard(title: "Gain Muscle", subtitle: "Build strength", icon: Icons.fitness_center, color: AppColors.protein),
          Spacer(),
          ElevatedButton(onPressed: (){}, child: Text("Continue")),
        ],
      ))),
    );
  }
}
class _GoalCard extends StatelessWidget {
  final String title, subtitle; final IconData icon; final Color color;
  const _GoalCard({required this.title, required this.subtitle, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.only(bottom: 16), child: ListTile(leading: Icon(icon, color: color, size: 32), title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(subtitle), trailing: Radio(value: true, groupValue: false, onChanged: (_){})));
  }
}
