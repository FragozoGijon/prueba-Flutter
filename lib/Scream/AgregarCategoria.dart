import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:prueba/providers/CategoriaProviders.dart';

import '../componentes/RoundedInput.dart';

class ScreamAgregarCategoria extends StatefulWidget {
  @override
  _ScreamAgregarCategoriaState createState() => _ScreamAgregarCategoriaState();
}

class _ScreamAgregarCategoriaState extends State<ScreamAgregarCategoria> {
  final TextEditingController _claveController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _fechaCreadoController = TextEditingController();

  @override
  void dispose() {
    _claveController.dispose();
    _nombreController.dispose();
    _fechaCreadoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          color: Color(0xffD3D3D3),
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 169, 228, 113),
          ),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        title: Text(
          "Formulario de Categoria",
          style: TextStyle(
              color: Color.fromARGB(255, 169, 228, 113), fontSize: 20),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          RoundedInput(
            icon: Icons.vpn_key,
            hint: "Clave",
            colorR: Colors.white,
            controller: _claveController, // Asignar el controlador aquí
          ),
          RoundedInput(
            icon: Icons.text_fields,
            hint: "Nombre",
            colorR: Colors.white,
            controller: _nombreController, // Asignar el controlador aquí
          ),
          RoundedInput(
            icon: Icons.date_range,
            hint: "Fecha Creación",
            colorR: Colors.white,
            controller: _fechaCreadoController, // Asignar el controlador aquí
          ),
          Spacer(),
          InkWell(
            onTap: () => _agregarElemento(context),
            borderRadius: BorderRadius.circular(80),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffD3D3D3), width: 2),
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(255, 169, 228, 113),
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Agregar',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _agregarElemento(BuildContext context) async {
    final categoriaProvider =
        Provider.of<CategoriaProviders>(context, listen: false);

    try {
      // Crea el JSON directamente
      final Map<String, dynamic> jsonData = {
        "clave": _claveController.text,
        "nombre": _nombreController.text,
        "fechaCreado": int.parse(_fechaCreadoController.text),
        /*  "activo": true,
        "version": 1,
        "categoria": null, // Asumiendo que no tiene categoría padre
        "categorias": [], // Asumiendo que no tiene subcategorías
        */
      };

      // Llama al método de agregar categoría pasándole el JSON directamente
      await categoriaProvider.agregarCategoria(jsonData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Categoría agregada exitosamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al agregar la categoría: $e')),
      );
    }
  }
}
