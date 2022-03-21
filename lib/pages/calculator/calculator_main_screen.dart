import 'package:flutter/material.dart';
import 'button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorMainScreen extends StatefulWidget {
  const CalculatorMainScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorMainScreen> createState() => _CalculatorMainScreenState();
}

class _CalculatorMainScreenState extends State<CalculatorMainScreen> {
  var userQuestion = '';
  var userAnswer = '';
  var isDark = false;
  List<String> buttons = [
    'C',
    'DEL',
    '%',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '00',
    '.',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.grey[850] : Colors.grey[300],
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: isDark
                      ? const Icon(
                          Icons.light_mode,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.dark_mode,
                          color: Colors.black54,
                        ),
                  onPressed: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                ),
              ),
              const Spacer(),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(userAnswer,
                        style: TextStyle(
                            fontSize: 20,
                            color: isDark ? Colors.white : Colors.black54)),
                  )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      userQuestion,
                      style: TextStyle(
                          fontSize: 40,
                          color: isDark ? Colors.white : Colors.black54),
                    ),
                  )),
              const SizedBox(
                height: 10,
              )
            ],
          )),
          const Divider(thickness: 1),
          Expanded(
              flex: 2,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return MyButton(
                          isDark: isDark,
                          buttonTapped: () {
                            setState(() {
                              clear();
                            });
                          },
                          buttonText: buttons[index],
                          textColor: Colors.green);
                    } else if (index == buttons.length - 1) {
                      return MyButton(
                          isDark: isDark,
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          textColor: Colors.orange);
                    } else if (index == 1) {
                      return MyButton(
                          isDark: isDark,
                          buttonTapped: () {
                            setState(() {
                              if (userQuestion.isNotEmpty) {
                                userQuestion = userQuestion.substring(
                                    0, userQuestion.length - 1);
                              }
                            });
                          },
                          buttonText: buttons[index],
                          textColor: const Color.fromARGB(255, 201, 85, 76));
                    }
                    return MyButton(
                      isDark: isDark,
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      textColor: isOperator(buttons[index])
                          ? Colors.orange
                          : isDark
                              ? Colors.white
                              : Colors.black54,
                    );
                  })),
        ]),
      ),
    );
  }

  bool isOperator(String s) {
    if (s == '÷' || s == '×' || s == '-' || s == '+' || s == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion =
        userQuestion.replaceAll('×', '*').replaceAll('÷', '/');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = userQuestion += ' = ';
    userQuestion = eval.toString();
  }

  void clear() {
    userAnswer = '';
    userQuestion = '';
  }
}
