import 'dart:ui';
import 'package:eat_list/category1.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class Review extends StatefulWidget {
  const Review({super.key});

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();
  List<String> comments = [];
  late Box reviewBox;

  @override
  void initState() {
    super.initState();
    reviewBox = Hive.box('reviewsBox');
    _loadSavedData();
  }

  void _loadSavedData() {
    setState(() {
      _rating = reviewBox.get('rating', defaultValue: 0);
      comments = List<String>.from(reviewBox.get('comments', defaultValue: []));
    });
  }

  void _saveData() {
    reviewBox.put('rating', _rating);
    reviewBox.put('comments', comments);
  }

  void _removeComment(int index) {
    setState(() {
      comments.removeAt(index);
      _saveData();
    });
  }

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
          "Review",
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/Couscous.jpg',
                      width: double.infinity,
                      height: screenHeight * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.02),
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Couscous",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                          (index) => IconButton(
                        icon: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: Colors.orange,
                          size: screenWidth * 0.08,
                        ),
                        onPressed: () {
                          setState(() {
                            _rating = index + 1;
                            _saveData();
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    height: screenHeight * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: "Leave a comment!",
                        border: InputBorder.none,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _commentController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.08, vertical: screenHeight * 0.02),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      ElevatedButton(
                        onPressed: () {
                          if (_commentController.text.isNotEmpty) {
                            setState(() {
                              comments.add(_commentController.text);
                              _saveData();
                              _commentController.clear();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.02),
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Column(
                    children: comments.map((comment) => Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(comment),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeComment(comments.indexOf(comment)),
                        ),
                      ),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
