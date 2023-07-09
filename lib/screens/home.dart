import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = "";
  var output = "";
  var operation = "";
  var hideinput = false;
  var outputSize = 55.0;
  onButtonclick(value) {
    if (value == "AC") {
      input = "";
      output = "";
    } else if (value == "<") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userinput = input;
        userinput = input.replaceAll("x", "*");
        userinput = input.replaceAll("+/-", "-");
        Parser p = Parser();
        Expression expression = p.parse(userinput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideinput = true;
        outputSize = 55.0;
      }
    } else {
      if (value == "+/-") {
        input = "$input-";
      } else {
        input = input + value;
      }
      hideinput = false;
      outputSize = 45.0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "Calculator",
          textScaleFactor: 2,
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
        centerTitle: true,
      ),
      body: Column(
        //inputoutput
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hideinput ? "" : input,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        output,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: outputSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ))),
          //buttons
          Row(
            children: [
              myButton(
                  myNumber: "AC",
                  butonColor: operatorColor,
                  tColor: greenColor),
              myButton(
                  myNumber: "<", butonColor: operatorColor, tColor: greenColor),
              myButton(
                  myNumber: "+/-",
                  butonColor: operatorColor,
                  tColor: greenColor),
              myButton(
                  myNumber: "/", butonColor: operatorColor, tColor: greenColor),
            ],
          ),
          Row(
            children: [
              myButton(myNumber: "7"),
              myButton(myNumber: "8"),
              myButton(myNumber: "9"),
              myButton(
                  myNumber: "x", butonColor: operatorColor, tColor: greenColor),
            ],
          ),
          Row(
            children: [
              myButton(myNumber: "4"),
              myButton(myNumber: "5"),
              myButton(myNumber: "6"),
              myButton(
                  myNumber: "-", butonColor: operatorColor, tColor: greenColor),
            ],
          ),

          Row(
            children: [
              myButton(myNumber: "1"),
              myButton(myNumber: "2"),
              myButton(myNumber: "3"),
              myButton(
                  myNumber: "+", butonColor: operatorColor, tColor: greenColor),
            ],
          ),
          Row(
            children: [
              myButton(
                  myNumber: "%", butonColor: operatorColor, tColor: greenColor),
              myButton(myNumber: "0"),
              myButton(myNumber: "."),
              myButton(myNumber: "=", butonColor: greenColor),
            ],
          ),
        ],
      ),
    );
  }

  Expanded myButton(
      {myNumber, tColor = Colors.white, butonColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(9),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: butonColor,
              foregroundColor: tColor,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                //color: tColor,
              )),
          onPressed: () {
            onButtonclick(myNumber);
          },
          child: Text(
            myNumber,
          ),
        ),
      ),
    );
  }
}
