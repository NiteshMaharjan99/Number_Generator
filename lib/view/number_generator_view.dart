import 'dart:math';

import 'package:flutter/material.dart';

class NumberGeneratorView extends StatefulWidget {
  const NumberGeneratorView({super.key});

  @override
  State<NumberGeneratorView> createState() => _NumberGeneratorViewState();
}

class _NumberGeneratorViewState extends State<NumberGeneratorView> {
  int _num1 = 0;
  int _num2 = 0;
  int _score = 0;
  int incorrectAns = 0;
  int correctAns = 0;
  void _generateNumber() {
    setState(() {
      _num1 = Random().nextInt(100);
      _num2 = Random().nextInt(100);
      initState(){
        if (_num1 == _num2) {
          _generateNumber();
        } else if (_num1 > _num2) {
          correctAns = _num1;
          incorrectAns = _num2;
          _score++;
        } else if (_num1 < _num2){
          correctAns = _num2;
          incorrectAns = _num1;
          _score++;
        } 
      }
    });
  }

  void _resetGame() {
    setState(() {
      _num1 = 0;
      _num2 = 0;
      _score = 0;
      incorrectAns = 0;
      correctAns = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Generator App"),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: _generateNumber,
                    child: Text("$_num1"),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: _generateNumber,
                    child: Text("$_num2"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                Text("Result: $_score"),
                const SizedBox(height: 12),
                Text("Incorrect answer: $incorrectAns"),
                const SizedBox(height: 12),
                Text("Correct answer: $correctAns"),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _resetGame,
                  child: const Text('Restart Game'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
