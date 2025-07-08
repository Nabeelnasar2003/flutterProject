import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CurvedSquare(),
        ),
      ),
    );
  }
}

class CurvedSquare extends StatelessWidget {
  const CurvedSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // align vertically center
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Image(
              image: AssetImage('assets/images/5332447875512265802.jpg'),
              width: 50,
              height: 50,
            ),
          ),
          SizedBox(width: 10),
          // Texts stacked vertically
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // center texts vertically
            crossAxisAlignment: CrossAxisAlignment.start, // align texts to start (left)
            children: [
              Text(
                'Nabeel',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Kannur',
                style: TextStyle(
                  fontFamily: 'Courier New',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Kerala',
                style: TextStyle(
                  fontFamily: 'Cursive',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
