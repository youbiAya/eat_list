import 'package:flutter/material.dart';

class Opening3 extends StatelessWidget {
  const Opening3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:screenHeight*0.08),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:screenWidth*0.05),
            child: Text("Ready to make \nmeal planning easy?", style:
            TextStyle(
                fontSize:screenWidth*0.08,fontWeight:FontWeight.bold,color:const Color(0xFFFFA242),
              ),
            ),
          ),

          SizedBox(height:screenHeight*0.02),

          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Image.asset('assets/op3pic.jpg',
                    fit: BoxFit.cover,
                  ),
                ),

                // mask on top
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height:screenHeight*0.12, width:double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.0),
                        ],
                      ),),),),

                // mask on bottom
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height:screenHeight*0.15, width:double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white.withOpacity(0.9),
                          Colors.white.withOpacity(0.0),
                        ],
                      ),),),),
              ],
            ),
          ),

          SizedBox(height:screenHeight*0.02),

          Padding(
            padding: EdgeInsets.only(
              right:screenWidth*0.05,bottom:screenHeight*0.03,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal:screenWidth*0.12,
                    vertical:screenHeight*0.015,
                  ),
                ),
                child: Text("Continue", style:
                TextStyle(
                    fontSize:screenWidth*0.05,color:const Color(0xFFF9DE8A),
                  ),),),),),


             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle,size:screenWidth*0.05,color:Colors.orange.shade300),
                SizedBox(width:screenWidth*0.03),
                Icon(Icons.circle,size:screenWidth*0.05,color:Colors.orange.shade300),
                SizedBox(width:screenWidth*0.03),
                Icon(Icons.circle,size:screenWidth*0.05,color:Colors.orange.shade700),
              ],
            ),
          SizedBox(height:screenHeight*0.05),
        ],
      ),
    );
  }
}
