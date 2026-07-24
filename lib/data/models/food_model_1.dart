import 'package:hive/hive.dart';

part 'food_model.g.dart';

/// Food Model - 20 years exp: Hive for offline + JSON for API
@HiveType(typeId: 0)
class FoodModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String nameEn;
  @HiveField(2)
  final String nameUrdu;
  @HiveField(3)
  final String nameAr;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String servingSize;
  @HiveField(6)
  final double calories;
  @HiveField(7)
  final double protein;
  @HiveField(8)
  final double carbs;
  @HiveField(9)
  final double fat;
  @HiveField(10)
  final String? barcode;
  @HiveField(11)
  final String? imageUrl;
  @HiveField(12)
  final bool isDesi;

  FoodModel({
    required this.id,
    required this.nameEn,
    this.nameUrdu = '',
    this.nameAr = '',
    required this.category,
    required this.servingSize,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.barcode,
    this.imageUrl,
    this.isDesi = false,
  });

  /// Get localized name based on current language
  String getLocalizedName(String languageCode) {
    switch (languageCode) {
      case 'ur':
        return nameUrdu.isNotEmpty ? nameUrdu : nameEn;
      case 'ar':
        return nameAr.isNotEmpty ? nameAr : nameEn;
      default:
        return nameEn;
    }
  }

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'] as String,
      nameEn: json['nameEn'] as String,
      nameUrdu: json['nameUrdu'] ?? '',
      nameAr: json['nameAr'] ?? '',
      category: json['category'] as String,
      servingSize: json['servingSize'] as String,
      calories: (json['calories'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      barcode: json['barcode'],
      imageUrl: json['imageUrl'],
      isDesi: json['isDesi'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nameEn': nameEn,
    'nameUrdu': nameUrdu,
    'nameAr': nameAr,
    'category': category,
    'servingSize': servingSize,
    'calories': calories,
    'protein': protein,
    'carbs': carbs,
    'fat': fat,
    'barcode': barcode,
    'imageUrl': imageUrl,
    'isDesi': isDesi,
  };
}
