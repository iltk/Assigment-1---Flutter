import 'dart:math';

import 'package:flutter/material.dart';

//define application colors
const Color appBarBackgroundColor = Color(0xFF147CD3);
const Color bodyBackgroundColor = Color(0xFF2196F3);
const Color buttonColor = Color(0xFF147CD3);
const Color textColor = Colors.white;

// define template for all btns
ButtonStyle _elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: buttonColor,
  foregroundColor: textColor,
  shape: RoundedRectangleBorder(),
  minimumSize: Size(double.infinity, 50),
  elevation: 0,
  textStyle: TextStyle(fontSize: 16),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assigment 1',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(title: 'Random Number Generator'),
    );
  }
}

//home page
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _randomNum = 0;

  void _generateNumber() {
    setState(() {
      _randomNum = Random().nextInt(9) + 1;
    });
  }

  void _viewStat() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => const StatPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.home, color: textColor),
          onPressed: () {},
          ),
        title: Text(widget.title, style: TextStyle(color: textColor)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _randomNum == 0
                  ? Text("Intial state")
                  : Text(
                      '$_randomNum',
                      style: TextStyle(color: textColor, fontSize: 80),
                    ),
            ),
          ),

          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: _generateNumber,
            child: const Text('Generate'),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: _viewStat,
            child: const Text('View Statistics'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

//statistic page
class StatPage extends StatefulWidget {
  const StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  void _reset() {}

  void _backToHome() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: _backToHome,
          ),
        title: Text('Statistics', style: TextStyle(color: textColor)),
      ),
      body: Column(
        children: [
        
          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: _reset,
            child: const Text('Reset'),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: _backToHome,
            child: const Text('Back to Home'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
