import 'package:eat_list/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:eat_list/Calendar.dart';
import 'package:eat_list/category1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CookingMenuPage(),
    );
  }
}

class CookingMenuPage extends StatefulWidget {
  @override
  _CookingMenuPageState createState() => _CookingMenuPageState();
}

class _CookingMenuPageState extends State<CookingMenuPage> {
  final Color primaryColor = Color(0xFFFFA630);
  int _selectedIndex = 0; // Track selected index for BottomNavigationBar

  // Methods to navigate to other pages for each tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Implement navigation logic
    if (_selectedIndex == 0) {
      // Home - no navigation needed as we're already on the home screen
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CalendarPage()), // Navigate to Calendar page
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoriesScreen()), // Navigate to Categories page
      );
    } else if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profilescreen()), // Navigate to Profile page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define some spacing and padding based on the screen size
    double horizontalPadding = screenWidth * 0.05; // 5% of screen width
    double verticalPadding = screenHeight * 0.02; // 2% of screen height
    double imageHeight = screenHeight * 0.25; // Set image height to 25% of screen height
    double fontSize = screenWidth * 0.05; // Adjust font size based on screen width

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: verticalPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Text(
                  "What are we cooking today?",
                  style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: verticalPadding),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1586190848861-99aa4a171e90', // Actual image URL
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Preset menu for you",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: verticalPadding * 2),
              Container(
                padding: EdgeInsets.all(horizontalPadding),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's menu",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize * 0.9,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Lunch", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text("Dinner", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: verticalPadding),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        'https://images.unsplash.com/photo-1586190848861-99aa4a171e90', // Replace with actual images
                        'https://images.unsplash.com/photo-1573497491209-c473b1f2c0b1',
                        'https://images.unsplash.com/photo-1604032411083-16e62bba944d',
                        'https://images.unsplash.com/photo-1604184522780-2f513f6f38c1',
                        'https://images.unsplash.com/photo-1625941715206-d91eacb2ba67',
                        'https://images.unsplash.com/photo-1603803645815-084c3f963d5b',
                      ].map((url) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: verticalPadding),
                    Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.menu_book, color: primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: primaryColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: primaryColor),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, color: primaryColor),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: primaryColor),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
