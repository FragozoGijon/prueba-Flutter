import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/ArticuloModel.dart';
import '../providers/ArticulosProviders.dart';

class ScreamArticulos extends StatefulWidget {
  @override
  _ScreamArticulosState createState() => _ScreamArticulosState();
}

class _ScreamArticulosState extends State<ScreamArticulos> {
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
        title: Text("Lista De Artículos",
            style: TextStyle(
                color: Color.fromARGB(255, 169, 228, 113), fontSize: 20)),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: _listaArticulos(),
          ),
        ],
      ),
    );
  }

  Widget _listaArticulos() {
    final articulosProvider = Provider.of<ArticulosProviders>(context);

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

  Widget _card(Datum articulo) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${articulo.id}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Versión: ${articulo.version}'),
                SizedBox(height: 8),
                Text('Clave: ${articulo.clave}'),
                SizedBox(height: 8),
                Text('Nombre: ${articulo.nombre}'),
                SizedBox(height: 8),
                Text('Activo: ${articulo.activo ? 'Sí' : 'No'}'),
                SizedBox(height: 8),
                Text('Categoría: ${articulo.categoria.nombre}'),
                SizedBox(height: 8),
                Text(
                    'Fecha Creación: ${DateTime.fromMillisecondsSinceEpoch(articulo.categoria.fechaCreado).toLocal()}'),
                SizedBox(height: 8),
                Text('Precios:'),
                ...articulo.precios
                    .map((precio) => Text(
                        ' - Precio ID: ${precio.id}, Valor: ${precio.precio}'))
                    .toList(),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // Implementar la funcionalidad para editar el artículo
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _mostrarDialogoConfirmacion(
                            context,
                            articulo
                                .id); // Asegúrate de pasar el id del artículo
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

  void _mostrarDialogoConfirmacion(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmación"),
          content: Text("¿Estás seguro de que deseas eliminar este artículo?"),
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
                _eliminarElemento(context, id); // Pasa el id
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
        Provider.of<ArticulosProviders>(context, listen: false);
    try {
      await articulosProvider.eliminarElemento(id); // Elimina basado en el id
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Artículo eliminado con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el artículo')),
      );
    }
  }
}
