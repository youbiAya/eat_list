import 'dart:ui';
import 'package:eat_list/profile_screen.dart';
import 'package:flutter/material.dart';
import 'calendar_screen.dart';
import 'category2.dart';
import 'home_screen.dart';
//import 'home_screen.dart';
//import 'calendar_screen.dart';
//import 'profile_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
          "Categories",
          style: TextStyle(
            fontSize: screenWidth * 0.06, // Responsive font size
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
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
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildCategoryItem(context, 'Lunch', 'assets/Lunch.jpg', screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  buildCategoryItem(context, 'Dinner', 'assets/Soup.jpg', screenWidth, screenHeight),
                ],
              ),
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

  Widget buildCategoryItem(BuildContext context, String title, String imagePath, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoriesScreen(category: title),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image.asset(
                imagePath,
                width: screenWidth * 0.9, // Responsive width
                height: screenHeight * 0.18, // Responsive height
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.06, // Responsive text size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
