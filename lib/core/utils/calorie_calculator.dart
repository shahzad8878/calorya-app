
class CalorieCalculator {
  // Mifflin-St Jeor - Gold standard
  static double calculateBMR({required int age, required double weight, required double height, required bool isMale}) {
    if (isMale) return 10*weight + 6.25*height - 5*age + 5;
    return 10*weight + 6.25*height - 5*age - 161;
  }
  static double calculateTDEE(double bmr, String activity) {
    const factors = {"sedentary": 1.2, "light": 1.375, "moderate": 1.55, "active": 1.725};
    return bmr * (factors[activity] ?? 1.2);
  }
  static double targetCalories(double tdee, String goal) {
    if (goal == "lose") return tdee - 500;
    if (goal == "gain") return tdee + 300;
    return tdee;
  }
}
