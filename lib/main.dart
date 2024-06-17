// ignore_for_file: prefer_const_constructors

import 'package:calculator/Util/calculator.dart';
import 'package:calculator/Widget/button.dart';
import 'package:calculator/Widget/textButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Calculator calculator = Calculator();
  final TextEditingController _controller = TextEditingController();
  double _fontSize = 75;

  @override
  void initState() {
    super.initState();
    _controller.addListener(adjustFontSize);
  }

  void clearText() {
    setState(() {
      _controller.clear();
    });
  }

  void adjustFontSize() {
    setState(() {
      int length = _controller.text.length;
      if (length <= 8) {
        _fontSize = 75;
      } else if (length <= 9) {
        _fontSize = 65;
      } else if (length <= 10) {
        _fontSize = 60;
      } else if (length <= 11) {
        _fontSize = 55;
      } else if (length <= 12) {
        _fontSize = 50;
      } else if (length <= 13) {
        _fontSize = 45;
      } else if (length <= 14) {
        _fontSize = 40;
      } else if (length <= 15) {
        _fontSize = 35;
      } else {
        _fontSize = 30;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(251, 42, 42, 49),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    maxLength: 20,
                    cursorWidth: 3,
                    controller: _controller,
                    textAlign: TextAlign.right,
                    readOnly: true,
                    autofocus: true,
                    showCursor: true,
                    cursorColor: Colors.blue,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: _fontSize,
                        letterSpacing: 5,
                        fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 22,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextButton(
                  text: '√',
                  onPressed: () => calculator.calculateSquareRoot(_controller),
                ),
                CustomTextButton(
                  text: 'π',
                  onPressed: () => calculator.calculatePie(_controller),
                ),
                CustomTextButton(
                  text: '^',
                  onPressed: () => calculator.calculateSquare(_controller),
                ),
                CustomTextButton(
                  text: '!',
                  onPressed: () => calculator.calculateFactorial(_controller),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                    label: 'C', color: Colors.green, onPressed: clearText),
                RoundedButton(
                    label: '()',
                    color: Color.fromARGB(255, 1, 75, 121),
                    onPressed: () => calculator.appendText('()', _controller)),
                RoundedButton(
                    label: '%',
                    color: Color.fromARGB(255, 1, 75, 121),
                    onPressed: () =>
                        calculator.calculatePercentage(_controller)),
                RoundedButton(
                    label: '÷',
                    color: Color.fromARGB(255, 1, 75, 121),
                    onPressed: () => calculator.appendText('÷', _controller)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                    label: '7',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('7', _controller)),
                RoundedButton(
                    label: '8',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('8', _controller)),
                RoundedButton(
                    label: '9',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('9', _controller)),
                RoundedButton(
                    label: 'X',
                    color: Color.fromARGB(255, 1, 75, 121),
                    onPressed: () => calculator.appendText('X', _controller)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                    label: '4',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('4', _controller)),
                RoundedButton(
                    label: '5',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('5', _controller)),
                RoundedButton(
                    label: '6',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('6', _controller)),
                RoundedButton(
                    label: ' - ',
                    color: Color.fromARGB(255, 1, 75, 121),
                    onPressed: () => calculator.appendText('-', _controller)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                    label: '1',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('1', _controller)),
                RoundedButton(
                    label: '2',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('2', _controller)),
                RoundedButton(
                    label: '3',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('3', _controller)),
                RoundedButton(
                    label: '+',
                    color: Color.fromARGB(255, 1, 75, 121),
                    onPressed: () => calculator.appendText('+', _controller)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                    label: '0',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('0', _controller)),
                RoundedButton(
                    label: '.',
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () => calculator.appendText('.', _controller)),
                RoundedButton(
                    icon: Icons.arrow_back,
                    color: Color.fromARGB(255, 33, 34, 34),
                    onPressed: () =>
                        calculator.removeLastCharacter(_controller)),
                RoundedButton(
                    label: '=',
                    color: Color.fromARGB(255, 1, 75, 121),
                    onPressed: () => calculator.equate(_controller)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
