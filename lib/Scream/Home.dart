import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba/componentes/titulo.dart';

import 'AgregarArticulo.dart';
import 'AgregarCategoria.dart';
import 'ListaCategorias.dart';
import 'ListaProductos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Titulo('Categoria', Colors.black, 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Column contents vertically,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Column contents horizontally
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      padding: const EdgeInsets.only(top: 80),
                      //boton
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreamCategorias()));
                        },
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffD3D3D3), width: 2),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color.fromARGB(255, 169, 228, 113)),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text('Consultar',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    Container(
                      alignment: AlignmentDirectional.center,
                      padding: const EdgeInsets.only(top: 80),
                      //boton
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ScreamAgregarCategoria()));
                        },
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffD3D3D3), width: 2),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color.fromARGB(255, 169, 228, 113)),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text('Agregar',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))
                                //,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Titulo('Articulos', Colors.black, 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Column contents vertically,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Column contents horizontally
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      padding: const EdgeInsets.only(top: 80),
                      //boton
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreamArticulos()));
                        },
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffD3D3D3), width: 2),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color.fromARGB(255, 169, 228, 113)),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text('Consultar',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))
                                //,
                                ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    Container(
                      alignment: AlignmentDirectional.center,
                      padding: const EdgeInsets.only(top: 80),
                      //boton
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ScreamAgregarArticulo()));
                        },
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffD3D3D3), width: 2),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color.fromARGB(255, 169, 228, 113)),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text('Agregar',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
