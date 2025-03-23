import 'package:flutter/material.dart';

class Opening1 extends StatelessWidget {
  const Opening1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFF7400),
      body: Stack(
        children: [
          Positioned(
            top:0, left:0,
            child:Image.asset('assets/op1pic.png',width:550,height:screenHeight*0.3,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left:screenWidth*0.05, right:screenWidth*0.05, top:screenHeight*0.45,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Don’t Know What To Cook Today?", style:
                TextStyle(fontSize:screenWidth*0.06,fontWeight:FontWeight.w600, color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text("Need Meal Inspiration?", style:
                TextStyle(fontSize: screenWidth*0.06, fontWeight:FontWeight.w600, color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text("We’ve Got You Covered!", style:
                TextStyle(fontSize: screenWidth*0.12,fontWeight:FontWeight.bold, color: Colors.white,
                  ),
                ),
                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle,size:screenWidth*0.05,color:Colors.white70),
                    SizedBox(width:screenWidth*0.03),
                    Icon(Icons.circle,size:screenWidth*0.05,color:Colors.white30),
                    SizedBox(width:screenWidth*0.03),
                    Icon(Icons.circle,size:screenWidth*0.05,color:Colors.white30),
                  ],
                ),
                SizedBox(height:screenHeight*0.05),
              ],
            ),),],
      ),
    );
  }
}
