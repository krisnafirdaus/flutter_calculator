import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.blue,
       textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
      ),
        home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String output = "0";

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String buttonText){
    if(buttonText == 'CLEAR'){
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '/' || buttonText == 'x'){
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.'){
      if(_output.contains('.')){
        print('Already contains a decimals');
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '='){
      num2 = double.parse(output);

      if(operand == '+'){
        _output = (num1 + num2).toString();
      }
      if(operand == '-'){
        _output = (num1 - num2).toString();
      }
      if(operand == 'x'){
        _output = (num1 * num2).toString();
      }
      if(operand == '/'){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        color: Colors.white,
        padding: EdgeInsets.all(24.0),
        borderSide: BorderSide(
            color: Colors.white,
            width: 2.0),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12
              ),
                child: Text(
              output,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            )),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('x')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('CLEAR'),
                    buildButton('='),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
