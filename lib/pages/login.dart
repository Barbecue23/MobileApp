import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(PinLogin());
}

class PinLogin extends StatefulWidget {
  @override
  _PinLoginState createState() => _PinLoginState();
}

class _PinLoginState extends State<PinLogin> {
  String pin = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.security,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'PIN LOGIN',
                    style: GoogleFonts.poppins(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    pin.padRight(6, '_'),
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Center(
                child: PinLoginScreen(
                  addNumber: addNumber,
                  deleteLastNumber: deleteLastNumber,
                  clearAll: clearAll,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addNumber(String num) {
    if (pin.length < 6) {
      setState(() {
        pin += num;
      });
    }
  }

  void deleteLastNumber() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  void clearAll() {
    setState(() {
      pin = '';
    });
  }
}

class PinLoginScreen extends StatelessWidget {
  final Function(String) addNumber;
  final VoidCallback deleteLastNumber;
  final VoidCallback clearAll;

  PinLoginScreen({
    required this.addNumber,
    required this.deleteLastNumber,
    required this.clearAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildNumberButton('1', 'one'),
                  SizedBox(width: 15),
                  buildNumberButton('2', 'two'),
                  SizedBox(width: 15),
                  buildNumberButton('3', 'three'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildNumberButton('4', 'four'),
                  SizedBox(width: 15),
                  buildNumberButton('5', 'five'),
                  SizedBox(width: 15),
                  buildNumberButton('6', 'six'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildNumberButton('7', 'seven'),
                  SizedBox(width: 15),
                  buildNumberButton('8', 'eight'),
                  SizedBox(width: 15),
                  buildNumberButton('9', 'nine'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildFunctionButton('X', clearAll),
                  SizedBox(width: 15),
                  buildNumberButton('0', 'zero'),
                  SizedBox(width: 15),
                  buildFunctionButton('⌫', deleteLastNumber),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNumberButton(String label, String textBelow) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: TextButton(
            onPressed: () {
              addNumber(label);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.kanit(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    textBelow,
                    style:
                        GoogleFonts.kanit(fontSize: 12.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFunctionButton(String label, VoidCallback onPressed) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0),
            ),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.kanit(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
