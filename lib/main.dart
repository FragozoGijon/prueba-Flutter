import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Scream/Home.dart';
import 'Scream/ListaProductos.dart';
import 'providers/ArticulosProviders.dart';
import 'providers/CategoriaProviders.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ArticulosProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriaProviders(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: (MyApp())),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      home: HomePage(),
    );
  }
}
