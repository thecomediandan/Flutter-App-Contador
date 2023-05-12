import 'package:flutter/material.dart';

// * Normalmente optamos por utilizar StatefulWidget para realizar operaciones con variables que puedan cambiar la naturaleza del Widget, que no ocurre con StatelessWidget que todo permanece constante.
class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

// * Widget con estados variables
class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Counter Screen')),
          leading: IconButton(
              // ? Botones del NavBar del lado izquierdo, permite solo uno, pero podemos utilizar un widget contenedor o layaut para agregar cuantos botones necesitemos.
              onPressed: () {
                clickCounter = 0;
                setState(() {});
              },
              icon: const Icon(Icons.replay_outlined)),
          actions: [
            // ? Action recibe un arreglo de Widgets que en este caso pusimos botones
            IconButton(
                onPressed: () {
                  clickCounter = 0;
                  setState(() {});
                },
                icon: const Icon(Icons.replay_outlined)),
            IconButton(
                onPressed: () {
                  clickCounter = 0;
                  setState(() {});
                },
                icon: const Icon(Icons.replay_outlined)),
          ],
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              '${clickCounter < 0 ? clickCounter = 0 : clickCounter}', // ? Nuestra propuesta para controlar los valores del contador por debajo de 0
              style: const TextStyle(
                  fontSize: 160,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255))),
          Text('Click${clickCounter == 1 ? '' : 's'}',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25))
        ])),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomFloatingActionButton(
              icon: Icons.replay_outlined,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              }),
          const SizedBox(height: 10), // ? Widget que sirve de espaciador
          CustomFloatingActionButton(
              icon: Icons.exposure_minus_1,
              onPressed: () {
                // ? if (clickCounter == 0) return; // Otra manera de detener la resta debajo de 0
                setState(() {
                  clickCounter--;
                });
              }),
          const SizedBox(height: 10),
          CustomFloatingActionButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              })
          // ! Código redundante, para modularizar código redundante se crean Widgets personalizados, para generarlo nos posicionamos en FloatingActionButton, ctrl+. y extraimos el widget, el Widget no debe contener variables y otros que puedan depender de valores fuera del scope del widget.
          /*
          FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              child: const Icon(Icons.replay_outlined)),
          const SizedBox(height: 20),
          FloatingActionButton(
              shape: const StadiumBorder(),
              onPressed: () {
                setState(() {
                  clickCounter--;
                });
              },
              child: const Icon(Icons.exposure_minus_1)),
          const SizedBox(height: 20),
          FloatingActionButton(
              shape: const StadiumBorder(),
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },
              child: const Icon(Icons.plus_one))
              */
        ]),
        backgroundColor: const Color.fromARGB(255, 0, 255, 106));
  }
}

// * Este es un Widget personalizado debido a la repeticion de las mismas configuraciones
class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback?
      onPressed; // ? Investigamos el tipo de valor de onPressed presionando ctr+click
  const CustomFloatingActionButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: onPressed,
        enableFeedback:
            true, // ? Genera una vibracion o sonido dependiendo del dispositivo
        elevation: 20, // ? Eleva el Wisget en el eje Z
        child: Icon(icon));
  }
}
