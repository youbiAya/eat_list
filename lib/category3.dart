import 'dart:ui';
import 'package:eat_list/profile_screen.dart';
import 'package:flutter/material.dart';
import 'calendar_screen.dart';
import 'category1.dart';
import 'category2.dart';
import 'category3.dart';
import 'home_screen.dart';
//import 'home_screen.dart';
//import 'calendar_screen.dart';
//import 'profile_screen.dart';

class DetailedCategoriesScreen extends StatelessWidget {
  final String category;

  const DetailedCategoriesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<Map<String, String>> categories = [
      {"title": "Vegetarian", "image": "assets/Vegetarian.jpg"},
      {"title": "Seafood", "image": "assets/Seafood.jpg"},
      {"title": "Baked goods", "image": "assets/BakedGoods.jpg"},
      {"title": "Pasta", "image": "assets/Pasta.jpg"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          category,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.orange),
                filled: true,
                fillColor: Colors.orange.shade100,
                prefixIcon: Icon(Icons.search, color: Colors.orange),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(screenWidth * 0.05),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: screenWidth * 0.03,
                mainAxisSpacing: screenWidth * 0.03,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return buildCategoryItem(
                    categories[index]["title"]!,
                    categories[index]["image"]!,
                    screenWidth
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.only(bottom: screenHeight * 0.03, left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white, size: screenWidth * 0.08),
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today, color: Colors.white, size: screenWidth * 0.08),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarScreen()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.category, color: Colors.white, size: screenWidth * 0.08),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.white, size: screenWidth * 0.08),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(String title, String imagePath, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: screenWidth * 0.25,
              height: screenWidth * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
