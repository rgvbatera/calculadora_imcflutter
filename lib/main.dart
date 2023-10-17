import 'package:calculadora_imc_flutter_dio/page/calcular_imc.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
        debugShowCheckedModeBanner: false,
        title: 'IMC Nível',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade100),
          useMaterial3: true,
        ),
        home: const IMCCalculadora());
  }
}
