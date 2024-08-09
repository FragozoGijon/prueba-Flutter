import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Model/ArticuloModel.dart';

import '../componentes/RoundedInput.dart';
import '../providers/ArticulosProviders.dart';

class ScreamAgregarArticulo extends StatefulWidget {
  @override
  _ScreamAgregarArticuloState createState() => _ScreamAgregarArticuloState();
}

class _ScreamAgregarArticuloState extends State<ScreamAgregarArticulo> {
  final TextEditingController _claveController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _preciosController = TextEditingController();
  final TextEditingController _activoController = TextEditingController();

  @override
  void dispose() {
    _claveController.dispose();
    _categoriaController.dispose();
    _nombreController.dispose();
    _preciosController.dispose();
    _activoController.dispose();
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
          "Formulario de Artículo",
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
            controller: _claveController,
          ),
          RoundedInput(
            icon: Icons.category,
            hint: "Categoría",
            colorR: Colors.white,
            controller: _categoriaController,
          ),
          RoundedInput(
            icon: Icons.text_fields,
            hint: "Nombre",
            colorR: Colors.white,
            controller: _nombreController,
          ),
          RoundedInput(
            icon: Icons.monetization_on,
            hint: "Precios",
            colorR: Colors.white,
            controller: _preciosController,
          ),
          RoundedInput(
            icon: Icons.check_circle,
            hint: "Activo",
            colorR: Colors.white,
            controller: _activoController,
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

  void _agregarElemento(BuildContext context) {
    final articulosProvider =
        Provider.of<ArticulosProviders>(context, listen: false);

    try {
      /*  final List<Precio> precios = _preciosController.text
          .split(',')
          .map((precioStr) => Precio(precio: int.parse(precioStr.trim())))
          .toList();

      final newArticulo = Articulo(
        clave: _claveController.text,
        categoria: int.parse(_categoriaController.text),
        nombre: _nombreController.text,
        precios: precios,
        activo: _activoController.text.toLowerCase() == 'true',
      );

      articulosProvider.agregarElemento(newArticulo);*/
    } catch (e) {
      // Manejo de errores
      print('Error al agregar el artículo: $e');
    }
  }
}
