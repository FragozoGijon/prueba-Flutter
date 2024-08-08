import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  String title;
  Widget widgetToNavigate;
  Color colorb;
  Color colorTB;

  RoundedButton(this.title, this.widgetToNavigate, this.colorb, this.colorTB);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => widgetToNavigate)),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colorb,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(title,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: colorTB,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))
              //,
              ),
        ),
      ),
    );
  }
}
