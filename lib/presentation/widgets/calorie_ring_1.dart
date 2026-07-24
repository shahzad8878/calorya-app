import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Calorie Ring - The hero widget - 60fps animation
class CalorieRing extends StatelessWidget {
  final double consumed;
  final double target;
  final double burned;

  const CalorieRing({super.key, required this.consumed, required this.target, required this.burned});

  @override
  Widget build(BuildContext context) {
    final remaining = target - consumed + burned;
    final progress = (consumed / target).clamp(0.0, 1.0);
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 180,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 12,
                  backgroundColor: AppColors.primaryLight,
                  valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                ),
              ),
              Column(
                children: [
                  Text('${remaining.toInt()}', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const Text('kcal left', style: TextStyle(color: AppColors.textSecondary)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _MacroItem(label: 'Eaten', value: '${consumed.toInt()}', color: AppColors.primary),
              _MacroItem(label: 'Burned', value: '${burned.toInt()}', color: AppColors.error),
              _MacroItem(label: 'Target', value: '${target.toInt()}', color: AppColors.textSecondary),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroItem extends StatelessWidget {
  final String label, value;
  final Color color;
  const _MacroItem({required this.label, required this.value, required this.color});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 18)),
      Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
    ]);
  }
}
