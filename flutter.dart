import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeApp(),
));

class HomeApp extends StatefulWidget {

  @override
  _HomeAppState createState() => _HomeAppState();

}

class _HomeAppState extends State<HomeApp> {
  String output = "0";

  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String btnVal){
    print(btnVal);
    if(btnVal == "C"){
      _out = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }else if(btnVal == "+" || btnVal == "-" || btnVal =="*" || btnVal == "/"){
      num1 = double.parse(output);
      operand = btnVal;
      _out = "";
      output = output + btnVal;
    }else if(btnVal == "."){
      if(_out.contains(".")){
        print("Already exist");
        return;
      }else{
        _out = _out + btnVal;
      }
    }else if(btnVal == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        _out = (num2 + num1).toString();

      }
      if(operand == "-"){
        _out = (num1 - num2).toString();

      }
      if(operand == "*"){
        _out = (num2 * num1).toString();

      }
      if(operand == "/"){
        _out = (num1 / num2).toString();

      }
      num1 = 0.0;
      num2 = 0.0;
      //_out = "0";
    }else{
      _out = _out+ btnVal;
    }

    setState(() {
      output = double.parse(_out).toStringAsFixed(2);
    });
  }

  Widget buildButton(String ButtonVal){
    return new Expanded(
        child: Container(
          padding: EdgeInsets.all(0.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0,1.0),
                  blurRadius: 4.0,
                  spreadRadius: 1.0
              ),
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(-1.0,-2.0),
                  blurRadius: 4.0,
                  spreadRadius: 1.0
              ),
            ],
          ),
          child: MaterialButton(
            padding: EdgeInsets.all(30.0),
            child: Text(ButtonVal, style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
            ),
            onPressed: ()=>
                buttonPressed(ButtonVal),
          ),
        )
    );

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal:20,vertical: 45.0),
                    child: Text(output, style: TextStyle(
                      fontSize: 55.0,
                      color: Colors.yellow,
                    ),
                    )
                ),


                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        buildButton("."),
                        buildButton("C"),
                        buildButton("%"),
                        buildButton("/")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("*")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                        buildButton("+")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                        buildButton("-")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("0"),
                        buildButton("=")
                      ],
                    )
                  ],
                ),

                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal:10.0,vertical: 5.0),
                    child: Text("Sakshi_102103451", style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.pinkAccent
                    ),)
                ),
              ],
            ),
          )
      ),
    );
  }
}
