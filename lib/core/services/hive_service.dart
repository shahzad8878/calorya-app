
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/food_model.dart';
class HiveService {
  static Box<FoodModel> get foodBox => Hive.box<FoodModel>('foodsBox');
  static Future<void> addDesiFoods(List<FoodModel> foods) async {
    await foodBox.clear();
    for (var f in foods) await foodBox.add(f);
  }
  static List<FoodModel> searchFoods(String query) {
    return foodBox.values.where((f) => f.nameEn.toLowerCase().contains(query.toLowerCase()) || f.nameUrdu.contains(query)).toList();
  }
}
