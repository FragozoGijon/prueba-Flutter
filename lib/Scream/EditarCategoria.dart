import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/CategoriaModel.dart';
import '../providers/CategoriaProviders.dart';
import '../componentes/RoundedInput.dart';

class ScreamEditarCategoria extends StatefulWidget {
  final Datum categoria;
  final VoidCallback onCategoriaActualizada; // Callback agregado

  ScreamEditarCategoria(
      {required this.categoria,
      required this.onCategoriaActualizada}); // Constructor modificado

  @override
  _ScreamEditarCategoriaState createState() => _ScreamEditarCategoriaState();
}

class _ScreamEditarCategoriaState extends State<ScreamEditarCategoria> {
  late TextEditingController _claveController;
  late TextEditingController _nombreController;
  late TextEditingController _fechaCreadoController;

  @override
  void initState() {
    super.initState();
    _claveController = TextEditingController(text: widget.categoria.clave);
    _nombreController = TextEditingController(text: widget.categoria.nombre);

    _fechaCreadoController =
        TextEditingController(text: widget.categoria.fechaCreado.toString());
  }

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
          "Editar Categoría",
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
            icon: Icons.text_fields,
            hint: "Nombre",
            colorR: Colors.white,
            controller: _nombreController,
          ),
          RoundedInput(
            icon: Icons.date_range,
            hint: "Fecha Creación",
            colorR: Colors.white,
            controller: _fechaCreadoController,
          ),
          Spacer(),
          InkWell(
            onTap: () => _editarElemento(context),
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
                  'Guardar Cambios',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _editarElemento(BuildContext context) async {
    final categoriaProvider =
        Provider.of<CategoriaProviders>(context, listen: false);

    try {
      final Map<String, dynamic> jsonData = {
        "id": widget.categoria.id,
        "clave": _claveController.text,
        "nombre": _nombreController.text,
        "fechaCreado": int.parse(_fechaCreadoController.text),
        "activo": widget.categoria.activo,
        "version": widget.categoria.version,
        "categoria": widget.categoria.categoria,
        "categorias": widget.categoria.categorias,
      };

      await categoriaProvider.actualizarCategoria(
          widget.categoria.id, jsonData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Categoría actualizada exitosamente')),
      );

      widget.onCategoriaActualizada(); // Llama al callback

      Navigator.pop(
          context); // Regresa a la lista de categorías después de editar
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar la categoría: $e')),
      );
    }
  }
}
