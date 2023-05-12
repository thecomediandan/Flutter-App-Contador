import 'package:flutter/material.dart';
import 'package:flutter_app_contador/presentation/screens/counter_function_screen.dart';
// import 'package:flutter_app_contador/presentation/screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // En un inicio esto era constante ahora ya no, porque Theme no es una propiedad que pueda ser constante entonces se cambio a CounterScreen como constante, ya que es la razon por la cual MaterialApp estaba siendo constante
        debugShowCheckedModeBanner: false,
        home: const CounterFunctionScreen(),
        // const CounterScreen(), // CounterScreen es constante, por conveniencia los childs deberian ir al final.
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors
                .green)); //Cone sto podemos establecer temas en la aplicación, pero con colorSchemeSeed podemos escogher una paleta de colores predefinida
  }
}
