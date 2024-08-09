import 'package:flutter/material.dart';

import 'InputContainer.dart';

class RoundedInput extends StatefulWidget {
  const RoundedInput(
      {Key? key, required this.icon, required this.hint, required this.colorR})
      : super(key: key);

  final IconData icon;
  final String hint;
  final Color colorR;

  @override
  State<RoundedInput> createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  void _validate() {
    _form.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: InputContainer(
          colorR: widget.colorR,
          child: TextField(
            cursorColor: Color.fromARGB(255, 19, 19, 19),
            decoration: InputDecoration(
                icon: Icon(widget.icon,
                    color: Color.fromARGB(255, 169, 228, 113)),
                hintText: widget.hint,
                border: InputBorder.none),
          )),
    );
  }
}
