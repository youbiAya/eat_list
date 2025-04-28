import 'package:eat_list/Calendar.dart';
import 'package:eat_list/ProfileScreen.dart';
import 'package:eat_list/pageprinc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category1.dart';

class DishDetailsPage extends StatefulWidget {
  @override
  _DishDetailsPageState createState() => _DishDetailsPageState();
}

class _DishDetailsPageState extends State<DishDetailsPage> {
  final Color primaryColor = Color(0xFFFFA630);
  int _selectedIndex = 0;

  // Screens to navigate to
  final List<Widget> _pages = [
    CookingMenuPage(),
    CalendarPage(),
    CategoriesScreen(),
    Profilescreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the selected page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1625941715206-d91eacb2ba67',
                  width: double.infinity,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(horizontalPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: ListView(
                  children: [
                    Text("Couscous", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, size: 18, color: Colors.amber),
                            SizedBox(width: 4),
                            Text("3.9", style: TextStyle(fontSize: fontSize)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 18, color: primaryColor),
                            SizedBox(width: 4),
                            Text("20 min", style: TextStyle(fontSize: fontSize)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Text("Details", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: primaryColor)),
                    SizedBox(height: 8),
                    Text(
                      "Couscous is made from crushed wheat flour rolled into its constituent granules or pearls...",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/review'); // Use named route to navigate to Review
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: StadiumBorder(),
                      ),
                      child: Text("Add Review"),
                    ),
                    SizedBox(height: 24),
                    Text("Add To", textAlign: TextAlign.center, style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Column(
                      children: [
                        _buildAddToOption('Lunch', 'https://images.unsplash.com/photo-1606788075761-5b41c015fdf1'),
                        _buildAddToOption('Dinner', 'https://images.unsplash.com/photo-1603052875242-d7384d5c2b0c'),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget _buildAddToOption(String label, String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
          SizedBox(width: 12),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
