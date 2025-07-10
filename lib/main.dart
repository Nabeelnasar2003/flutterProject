import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
      
    );
  }
  }


final TextEditingController myController = TextEditingController();
final TextEditingController nextController = TextEditingController();



class SecondScreen extends StatelessWidget {
  final String name;
  final int age;
  const SecondScreen({Key? key, required this.name , required this.age}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
  Text(
        '$name',
  style: TextStyle(fontSize: 24, color: Colors.black)
  ),
  SizedBox(height: 20),
  Text(
        '$age',
  style: TextStyle(fontSize: 24, color: Colors.black)
  ),
  SizedBox(height: 20),
       ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
       ],
      ),
      ),
    );
  }
} 

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                labelText: 'Enter name',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
              ),
            ),
            SizedBox(height:20),
            TextField(
              controller: nextController,
              decoration: InputDecoration(
                labelText: 'Enter Age',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ),
            SizedBox(height: 15),
        ElevatedButton(
            onPressed: () {
              if(myController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please enter name")),
                );
              }
              else if(nextController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please enter age")),
                );
              }
              else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      name: myController.text,
                      age: int.parse(nextController.text),
                    ),
                  ),
                );
              }
            },
          
            child: const Text('Display'),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              myController.clear();
              nextController.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Fields cleared")),
              );
            },
            child: Text('Clear'),
          ),
        ],
      ),
    ),
      )
  );
  }
}