import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:prueba/Providers/CategoriaProviders.dart';
import '../Model/CategoriaModel.dart';
import '../componentes/RoundedInput.dart';

class ScreamAgregarCategoria extends StatefulWidget {
  @override
  _ScreamAgregarCategoriaState createState() => _ScreamAgregarCategoriaState();
}

class _ScreamAgregarCategoriaState extends State<ScreamAgregarCategoria> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _versionController = TextEditingController();
  final TextEditingController _claveController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _fechaCreadoController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _categoriasController = TextEditingController();
  final TextEditingController _activoController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _versionController.dispose();
    _claveController.dispose();
    _nombreController.dispose();
    _fechaCreadoController.dispose();
    _categoriaController.dispose();
    _categoriasController.dispose();
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
            icon: Icons.numbers,
            hint: "ID",
            colorR: Colors.white,
          ),
          RoundedInput(
            icon: Icons.info,
            hint: "Versión",
            colorR: Colors.white,
          ),
          RoundedInput(
            icon: Icons.vpn_key,
            hint: "Clave",
            colorR: Colors.white,
          ),
          RoundedInput(
            icon: Icons.text_fields,
            hint: "Nombre",
            colorR: Colors.white,
          ),
          RoundedInput(
            icon: Icons.date_range,
            hint: "Fecha Creación",
            colorR: Colors.white,
          ),
          RoundedInput(
            icon: Icons.category,
            hint: "Categoría",
            colorR: Colors.white,
          ),
          RoundedInput(
            icon: Icons.list,
            hint: "Categorías",
            colorR: Colors.white,
          ),
          RoundedInput(
            icon: Icons.check_circle,
            hint: "Activo",
            colorR: Colors.white,
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
      final newCategoria = Datum(
        id: int.parse(_idController.text),
        version: int.parse(_versionController.text),
        clave: _claveController.text,
        nombre: _nombreController.text,
        fechaCreado: int.parse(_fechaCreadoController.text),
        categoria: _categoriaController.text,
        categorias: _categoriasController.text.split(','),
        activo: _activoController.text.toLowerCase() == 'true',
      );

      categoriaProvider.agregarElemento(newCategoria);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el artículo')),
      );
    }
  }
}

extension on CategoriaProviders {
  void agregarElemento(Datum newCategoria) {
    categoria.add(newCategoria);
    notifyListeners();
  }
}
