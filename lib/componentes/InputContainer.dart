import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({Key? key, required this.child, required this.colorR})
      : super(key: key);

  final Widget child;
  final Color colorR;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: size.width * 0.8,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 169, 228, 113), width: 2),
              borderRadius: BorderRadius.circular(10),
              color: colorR),
          child: child),
    );
  }
}
