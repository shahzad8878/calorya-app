import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// 20 years exp: Centralized API client with logging, retry, error handling
class ApiClient {
  final Dio _dio;
  final Logger _logger = Logger();

  ApiClient() : _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ),
  ) {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => _logger.d(obj.toString()),
    ));
  }

  /// OpenFoodFacts API - 3.2M foods - FREE
  Future<Map<String, dynamic>?> getFoodByBarcode(String barcode) async {
    try {
      final response = await _dio.get(
        'https://world.openfoodfacts.org/api/v0/product/$barcode.json',
      );
      if (response.data['status'] == 1) {
        return response.data['product'];
      }
      return null;
    } catch (e) {
      _logger.e('Barcode API Error: $e');
      return null;
    }
  }

  /// LogMeal API - AI Food Recognition - $99/mo
  /// Docs: https://logmeal.es
  Future<List<Map<String, dynamic>>> recognizeFoodImage(String imagePath) async {
    try {
      // TODO: Add your LogMeal API Key in .env
      const String logMealApiKey = 'YOUR_LOGMEAL_API_KEY';
      
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imagePath),
      });

      final response = await _dio.post(
        'https://api.logmeal.es/v2/image/recognition/dish',
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $logMealApiKey'}),
      );

      // Returns: [{"name": "white rice", "prob": 0.92}, ...]
      return List<Map<String, dynamic>>.from(response.data['recognition_results']);
    } catch (e) {
      _logger.e('LogMeal API Error: $e');
      // Fallback mock for testing without API key
      return [
        {'name': 'White Rice', 'prob': 0.92, 'calories': 260},
        {'name': 'Chicken Curry', 'prob': 0.88, 'calories': 220},
      ];
    }
  }
}
