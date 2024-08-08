import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body: _body());
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
      builder: (_, AsyncSnapshot<List<Categoria>> snapshot) {
        if (snapshot.hasData) {
          final articulo = snapshot.data;

          return ListView.builder(
            itemCount: articulo?.length,
            itemBuilder: (_, int i) {
              return _card(articulo![i]);
            },
          );
        } else {
          print('sadsda');
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _card(Categoria categorias) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
