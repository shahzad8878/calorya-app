
import 'package:flutter/material.dart';
class RestaurantMenuScanner extends StatelessWidget {
  const RestaurantMenuScanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, appBar: AppBar(backgroundColor: Colors.black, title: Text("Menu Scanner", style: TextStyle(color: Colors.white))), body: Stack(children: [
      Center(child: Text("Camera Preview - Menu", style: TextStyle(color: Colors.white54))),
      Positioned(top: 100, left: 20, child: Container(padding: EdgeInsets.all(8), color: Colors.green, child: Text("Chicken Handi - 380 kcal", style: TextStyle(color: Colors.white)))),
      Positioned(top: 200, left: 20, child: Container(padding: EdgeInsets.all(8), color: Colors.green, child: Text("Naan - 270 kcal", style: TextStyle(color: Colors.white)))),
      Positioned(bottom: 20, left: 20, right: 20, child: Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Text("Scanned Cheezious Menu - 12 items detected", textAlign: TextAlign.center))),
    ]));
  }
}
