import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(MaterialApp(
    home: calculator(),
  ));
}

class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

  String display = "25+25";
  String RealTime;
  RegExp exp = new RegExp(r'[+\-\/*]');

  void updateRealTime() {
    //Parse string into expression
    Expression expression = Expression.parse("$display");

    //Create a context containing all the variables and function used in the expression (Example: cos, sin)
    var context;

    //Evaluate expression
    final evaluator = const ExpressionEvaluator();
    var r = evaluator.eval(expression, context);

    setState(() {
      RealTime = "$r";
    });
  }

  void displayUpdate(String e) {
    if (e == "CE") {
      if (display != null && display.length > 0) {
        setState(() {
          display = display.substring(0,display.length-1);
          updateRealTime();
        });
      } else {
        return;
      }
    }
    else if (e == "AC") {
      setState(() {
        display = "";
        RealTime = "";
      });
    }
    else if (exp.hasMatch(e) && exp.hasMatch(display[display.length-1]) || e == "=") {
      return;
    }
    else {
      setState(() {
        display += "$e";
      });
      updateRealTime();
    }
  }

  @override
  void initState() {
    updateRealTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 120,
              color: Colors.black,
              child: Text(
                '$display',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.black,
              child: Text(
                '$RealTime',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 50,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Divider(
              height: 0,
              thickness: 0.5,
              indent: 30,
              endIndent: 30,
              color: Colors.white,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("7"),
                          child: Text(
                            '7',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("4"),
                          child: Text(
                            '4',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("1"),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("."),
                          child: Text(
                            '.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("8"),
                          child: Text(
                            '8',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("5"),
                          child: Text(
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("2"),
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("0"),
                          child: Text(
                            '0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("9"),
                          child: Text(
                            '9',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("6"),
                          child: Text(
                            '6',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("3"),
                          child: Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          splashColor: Colors.grey[400],
                          onPressed: () => displayUpdate("="),
                          child: Text(
                            '=',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            splashColor: Colors.grey[400],
                            onPressed: () => displayUpdate("CE"),
                            child: Text(
                              'CE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            splashColor: Colors.grey[400],
                            onPressed: () => displayUpdate("AC"),
                            child: Text(
                              'AC',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            splashColor: Colors.grey[400],
                            onPressed: () => displayUpdate("/"),
                            child: Text(
                              '/',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            splashColor: Colors.grey[400],
                            onPressed: () => displayUpdate("*"),
                            child: Text(
                              '*',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            splashColor: Colors.grey[400],
                            onPressed: () => displayUpdate("-"),
                            child: Text(
                              '-',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            splashColor: Colors.grey[400],
                            onPressed: () => displayUpdate("+"),
                            child: Text(
                              '+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
//      backgroundColor: Colors.grey[800],
        backgroundColor: Colors.white,
    );
  }
}
