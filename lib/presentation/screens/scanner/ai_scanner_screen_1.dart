
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
class AIScannerScreen extends StatelessWidget {
  const AIScannerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, iconTheme: IconThemeData(color: Colors.white), title: Text("AI Food Scanner", style: TextStyle(color: Colors.white))),
      body: Stack(children: [
        Center(child: Icon(Icons.camera_alt, size: 100, color: Colors.white24)),
        Positioned(bottom: 100, left: 20, right: 20, child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Text("Detected Foods", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 12),
            _DetectedItem(name: "White Rice", conf: "92%", kcal: 260),
            _DetectedItem(name: "Chicken Curry", conf: "88%", kcal: 220),
            Divider(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Total", style: TextStyle(fontWeight: FontWeight.bold)), Text("480 kcal", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary))]),
            SizedBox(height: 12),
            ElevatedButton(onPressed: (){}, child: Text("Add to Lunch (480 kcal)")),
          ]),
        )),
        Positioned(bottom: 20, left: 0, right: 0, child: Center(child: Container(width: 80, height: 80, decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle), child: Icon(Icons.camera, size: 40, color: Colors.white)))),
      ]),
    );
  }
}
class _DetectedItem extends StatelessWidget {
  final String name, conf; final int kcal;
  const _DetectedItem({required this.name, required this.conf, required this.kcal});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 4), child: Row(children: [
      Expanded(child: Text(name)), 
      Container(padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(6)), child: Text(conf, style: TextStyle(fontSize: 10, color: AppColors.primary))),
      SizedBox(width: 8),
      Text("\${kcal} kcal", style: TextStyle(fontWeight: FontWeight.bold)),
    ]));
  }
}
