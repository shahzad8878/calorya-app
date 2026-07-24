import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/onboarding/welcome_screen.dart';
import 'data/models/food_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 20 years exp: Order matters - Firebase first, then Hive, then Localization
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(FoodModelAdapter()); // Generated via build_runner
  await Hive.openBox<FoodModel>('foodsBox');
  await Hive.openBox('userBox');
  
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'), Locale('ur'), Locale('ar'),
        Locale('es'), Locale('hi'), Locale('fr'),
        Locale('pt'), Locale('tr'), Locale('de'),
        Locale('id'), Locale('it'), Locale('bn'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('en'),
      child: const CaloryaApp(),
    ),
  );
}

class CaloryaApp extends StatelessWidget {
  const CaloryaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorya',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const WelcomeScreen(),
    );
  }
}

// Temporary adapter - replace with build_runner generated
class FoodModelAdapter extends TypeAdapter<FoodModel> {
  @override
  final int typeId = 0;
  @override
  FoodModel read(BinaryReader reader) => FoodModel(id: '', nameEn: '', category: '', servingSize: '', calories: 0, protein: 0, carbs: 0, fat: 0);
  @override
  void write(BinaryWriter writer, FoodModel obj) {}
}
