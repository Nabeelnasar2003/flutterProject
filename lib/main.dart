import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CombinedScreen(),
    );
  }
}

class CombinedScreen extends StatefulWidget {
  const CombinedScreen({super.key});

  @override
  State<CombinedScreen> createState() => _CombinedScreenState();
}

class _CombinedScreenState extends State<CombinedScreen> {
  final TextEditingController expressionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  String calculatorResult = '';
  String oddEvenResult = '';

  // Function to clear calculator input & result
  void clearExpression() {
    expressionController.clear();
    setState(() {
      calculatorResult = '';
    });
  }

  // Function to perform calculation
  void calculateExpression() {
    String input = expressionController.text;
    double res = 0;

    try {
      if (input.contains('+')) {
        var parts = input.split('+');
        res = double.parse(parts[0]) + double.parse(parts[1]);
      } else if (input.contains('-')) {
        var parts = input.split('-');
        res = double.parse(parts[0]) - double.parse(parts[1]);
      } else if (input.contains('*')) {
        var parts = input.split('*');
        res = double.parse(parts[0]) * double.parse(parts[1]);
      } else if (input.contains('/')) {
        var parts = input.split('/');
        double num2 = double.parse(parts[1]);
        if (num2 != 0) {
          res = double.parse(parts[0]) / num2;
        } else {
          setState(() {
            calculatorResult = 'Cannot divide by zero';
          });
          return;
        }
      } else {
        setState(() {
          calculatorResult = 'Invalid expression';
        });
        return;
      }

      setState(() {
        calculatorResult = 'Result: $res';
      });
    } catch (e) {
      setState(() {
        calculatorResult = 'Invalid input';
      });
    }
  }

  // Function to check odd or even
  void checkOddOrEven() {
    if (numberController.text.isEmpty) {
      setState(() {
        oddEvenResult = 'Please enter a number';
      });
      return;
    }

    int numValue = int.tryParse(numberController.text) ?? 0;

    setState(() {
      if (numValue % 2 == 0) {
        oddEvenResult = '$numValue is Even';
      } else {
        oddEvenResult = '$numValue is Odd';
      }
    });
  }

  // Clear Odd/Even input & result
  void clearOddEven() {
    numberController.clear();
    setState(() {
      oddEvenResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Personal Info
              const Text(
                'Name: Muhammed Nabeel Nasar\n'
                'Age: 22\n'
                'Education: MCA in AI/ML\n'
                'Location: Kerala, India\n'
                'Email: nabeel@gmail.com\n'
                'Hobby: watching Movies',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),

              // Calculator Section
              Text(
                'Calculator',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: expressionController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Enter expression (e.g. 5+3)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: calculateExpression,
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: clearExpression,
                child: const Text('Clear'),
              ),
              const SizedBox(height: 10),
              Text(
                calculatorResult,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
             

              Text(
                'Odd or Even Checker',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: checkOddOrEven,
                child: const Text('Check'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: clearOddEven,
                child: const Text('Clear'),
              ),
              const SizedBox(height: 10),
              Text(
                oddEvenResult,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
