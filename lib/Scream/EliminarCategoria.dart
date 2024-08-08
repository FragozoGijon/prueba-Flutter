import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../componentes/titulo.dart';

class Vista_ElminarCategoria extends StatefulWidget {
  const Vista_ElminarCategoria({super.key});

  @override
  State<Vista_ElminarCategoria> createState() => _Vista_ElminarCategoriaState();
}

class _Vista_ElminarCategoriaState extends State<Vista_ElminarCategoria> {
  String _searchText = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          }, //on pressend
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        title: Titulo("Eliminar", Colors.black, 20),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(children: [
            Titulo("", Colors.black, 20),
            Container(
              width: MediaQuery.of(context).size.width / 1.85,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String text) {
                    // Actualiza la búsqueda del usuario
                    setState(() {
                      _searchText = text;
                    });
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
