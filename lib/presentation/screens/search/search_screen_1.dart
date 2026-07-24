
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> results = [
    {"name": "Chicken Biryani", "urdu": "چکن بریانی", "kcal": 480, "protein": 25, "isDesi": true},
    {"name": "Aloo Paratha", "urdu": "آلو پراٹھا", "kcal": 360, "protein": 6, "isDesi": true},
    {"name": "Nihari", "urdu": "نہاری", "kcal": 450, "protein": 28, "isDesi": true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Food")),
      body: Column(children: [
        Padding(padding: EdgeInsets.all(16), child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Search biryani, roti...",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            filled: true, fillColor: Colors.white,
          ),
        )),
        Expanded(child: ListView.builder(itemCount: results.length, itemBuilder: (c,i){
          final f = results[i];
          return Card(margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6), child: ListTile(
            leading: Container(width: 50, height: 50, decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(12)), child: Icon(Icons.restaurant, color: AppColors.primary)),
            title: Text(f["name"], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("\${f["urdu"]} • \${f["kcal"]} kcal • \${f["protein"]}g protein"),
            trailing: f["isDesi"] ? Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(8)), child: Text("DESI", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.orange))) : null,
            onTap: (){},
          ));
        })),
      ]),
    );
  }
}
