import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/app_colors.dart';

/// Welcome Screen - First screen user sees - 3 seconds to impress
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Language selector top-right
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.language, color: Colors.white, size: 28),
                    onPressed: () => _showLanguageSheet(context),
                  ),
                ),
                const Spacer(),
                // Logo
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
                  ),
                  child: const Icon(Icons.restaurant, size: 60, color: AppColors.primary),
                ),
                const SizedBox(height: 24),
                Text('Calorya', style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white)),
                const SizedBox(height: 8),
                Text('eat_smart'.tr(), style: const TextStyle(color: Colors.white, fontSize: 18)),
                const Spacer(),
                // CTA
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Goal Selection
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary),
                  child: Text('get_started'.tr()),
                ),
                const SizedBox(height: 16),
                Text('12 Languages • 3.2M Foods • AI Scanner', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('choose_language'.tr(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...[
              ('en', '🇺🇸 English'),
              ('ur', '🇵🇰 اردو'),
              ('ar', '🇸🇦 العربية'),
              ('es', '🇪🇸 Español'),
              ('hi', '🇮🇳 हिन्दी'),
            ].map((lang) => ListTile(
              title: Text(lang.$2),
              onTap: () {
                context.setLocale(Locale(lang.$1));
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
    );
  }
}
