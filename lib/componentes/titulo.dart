import 'package:flutter/widgets.dart';

class Titulo extends StatelessWidget {
  String title;
  Color colort;
  double size;

  Titulo(this.title, this.colort, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      overflow: TextOverflow.clip,
      title,
      style: TextStyle(
        fontSize: size,
      ),
    ));
  }
}
