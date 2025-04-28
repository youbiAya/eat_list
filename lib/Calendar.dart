import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  final Color primaryColor = Color(0xFFFFA630);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String? selectedDay;

  final List<String> days = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];

  void _onDaySelected(String day) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define some spacing and padding based on the screen size
    double horizontalPadding = screenWidth * 0.05; // 5% of screen width
    double verticalPadding = screenHeight * 0.02; // 2% of screen height

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: widget.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Calendar", style: TextStyle(color: widget.primaryColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: days.map((day) {
                return ElevatedButton(
                  onPressed: () {
                    _onDaySelected(day);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.primaryColor,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // Adjust button width
                  ),
                  child: Text(day, style: TextStyle(fontSize: screenWidth * 0.04)), // Adjust text size based on screen width
                );
              }).toList(),
            ),
            SizedBox(height: verticalPadding),
            if (selectedDay != null)
              Text(
                'You selected: $selectedDay',
                style: TextStyle(fontSize: screenWidth * 0.05, color: widget.primaryColor), // Adjust font size based on screen width
              ),
            SizedBox(height: verticalPadding),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.download),
              label: Text("Download"),
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.primaryColor,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Adjust padding for the button
              ),
            ),
            SizedBox(height: verticalPadding),
            Text(
              "Archives",
              style: TextStyle(fontWeight: FontWeight.bold, color: widget.primaryColor, fontSize: screenWidth * 0.045), // Adjust font size based on screen width
            ),
          ],
        ),
      ),
    );
  }
}
