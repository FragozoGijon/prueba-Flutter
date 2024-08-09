import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/Scream/EditarCategoria.dart';

import '../Model/CategoriaModel.dart';
import '../componentes/titulo.dart';
import '../providers/CategoriaProviders.dart';

class ScreamCategorias extends StatefulWidget {
  @override
  _ScreamCategoriasState createState() => _ScreamCategoriasState();
}

class _ScreamCategoriasState extends State<ScreamCategorias> {
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
        title: Titulo(
            "Lista De Categorias", Color.fromARGB(255, 169, 228, 113), 20),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: _listaEmpresas(),
          )
        ],
      ),
    );
  }

  Widget _listaEmpresas() {
    final articulosProvider = Provider.of<CategoriaProviders>(context);

    return FutureBuilder(
      future: articulosProvider.obtenerArticulos(),
      builder: (_, AsyncSnapshot<List<Datum>> snapshot) {
        if (articulosProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final articulo = snapshot.data;

          return ListView.builder(
            itemCount: articulo?.length,
            itemBuilder: (_, int i) {
              return _card(articulo![i]);
            },
          );
        } else {
          return Center(child: Text("No hay datos disponibles"));
        }
      },
    );
  }

  Widget _card(Datum categoria) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('ID: ${categoria.id}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Versión: ${categoria.version}'),
                SizedBox(height: 8),
                Text('Clave: ${categoria.clave}'),
                SizedBox(height: 8),
                Text('Nombre: ${categoria.nombre}'),
                SizedBox(height: 8),
                Text(
                    'Fecha Creado: ${DateTime.fromMillisecondsSinceEpoch(categoria.fechaCreado).toLocal()}'),
                SizedBox(height: 8),
                Text('Categoría Padre: ${categoria.categoria ?? 'N/A'}'),
                SizedBox(height: 8),
                Text(
                    'Subcategorías: ${categoria.categorias.isNotEmpty ? categoria.categorias.join(', ') : 'N/A'}'),
                SizedBox(height: 8),
                Text('Activo: ${categoria.activo ? 'Sí' : 'No'}'),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreamEditarCategoria(
                              categoria: categoria,
                              onCategoriaActualizada: () {
                                setState(() {
                                  // Llama a refreshArticulos para actualizar la lista
                                  Provider.of<CategoriaProviders>(context,
                                          listen: false)
                                      .refreshArticulos();
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _mostrarDialogoConfirmacion(context, categoria);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoConfirmacion(BuildContext context, Datum categoria) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmación"),
          content: Text("¿Estás seguro de que deseas eliminar este elemento?"),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo sin hacer nada
              },
            ),
            TextButton(
              child: Text("Eliminar"),
              onPressed: () {
                _eliminarElemento(context, categoria.id); // Pasa el id
                Navigator.of(context)
                    .pop(); // Cierra el diálogo después de eliminar
              },
            ),
          ],
        );
      },
    );
  }

  void _eliminarElemento(BuildContext context, int id) async {
    final articulosProvider =
        Provider.of<CategoriaProviders>(context, listen: false);
    try {
      await articulosProvider.eliminarElemento(id); // Elimina basado en el id
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Elemento eliminado con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el elemento')),
      );
    }
  }
}
