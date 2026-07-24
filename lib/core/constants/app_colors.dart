import 'package:flutter/material.dart';

/// 20+ years exp: No hardcoded colors anywhere.
/// Single source of truth for colors - easy to change theme in 1 place.
class AppColors {
  // Primary - Calorya Green - Your brand
  static const primary = Color(0xFF10B981);
  static const primaryDark = Color(0xFF059669);
  static const primaryLight = Color(0xFFD1FAE5);
  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF059669)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Neutrals
  static const background = Color(0xFFF9FAFB);
  static const surface = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF111827);
  static const textSecondary = Color(0xFF6B7280);
  static const border = Color(0xFFE5E7EB);

  // Semantic
  static const success = Color(0xFF10B981);
  static const error = Color(0xFFEF4444);
  static const warning = Color(0xFFF59E0B);
  
  // Macros
  static const protein = Color(0xFFEF4444);
  static const carbs = Color(0xFFF59E0B);
  static const fat = Color(0xFF3B82F6);
  static const calories = primary;

  // Meal colors
  static const breakfast = Color(0xFFFBBF24);
  static const lunch = Color(0xFF10B981);
  static const dinner = Color(0xFF8B5CF6);
  static const snacks = Color(0xFFEC4899);
}
