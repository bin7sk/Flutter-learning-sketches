import 'package:flutter/material.dart';

Widget make_a_list(int number, Digit first) {
  Digit prev = first;
  while (number > 1) {
    int prev_int = int.parse(prev.digit);
    prev_int++;
    Digit elem = Digit(prev_int.toString(), prev);
    prev.nextDigit = elem;
    prev = elem;
    number--;
  }
  prev.nextDigit = first;
  return first;
}

void main() {
  runApp(MaterialApp(
    home: make_a_list(5, Digit('1', null)),
  ));
}

class Digit extends StatelessWidget {
  Digit(this.digit, this.nextDigit, {Key? key}) : super(key: key);

  Digit? nextDigit;
  final String digit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(digit),),
        body: Center(
          child: GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextDigit as Digit)),
            child: Text(
              digit,
              style: TextStyle(fontSize: 220),
            ),
          ),
        ));
  }
}
