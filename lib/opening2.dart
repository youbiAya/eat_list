import 'package:flutter/material.dart';

class Opening2 extends StatelessWidget {
  const Opening2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFF7400),
      body: Stack(
        children: [
          Positioned(
            top:screenHeight*0.25,left:screenWidth*-0.2,
            child: Image.asset('assets/op2pic.png',width:screenWidth*1.2,height:screenHeight*0.7,
              fit: BoxFit.contain,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left:screenWidth*0.05,
              right:screenWidth*0.05,
              top:screenHeight*0.12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Plan your meals effortlessly!", style:
                TextStyle(
                    fontSize:screenWidth*0.1,fontWeight:FontWeight.bold,color:Colors.white,
                  ),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle,size:screenWidth*0.05,color:Colors.white30),
                    SizedBox(width:screenWidth*0.03),
                    Icon(Icons.circle,size:screenWidth*0.05,color:Colors.white70),
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
