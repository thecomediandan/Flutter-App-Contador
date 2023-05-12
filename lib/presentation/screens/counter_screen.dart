import 'package:flutter/material.dart';

// * Aqui lo que hicimos fue cambiar de StatelessWidget a StatefulWidget, por lo general hay que tratar de evitar usar StatesulWidget, porque es más pesado y consume más recursos. Nuestro buid ahora forma parte de una clase _CounterScreenState que se crea automaticamente al presionar ctrl+. posicionandonos en StatelessWidget al cambiar a StatefulWidget
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // ? Este es nuestro contador de clicks
  int clickCounter = 0;
  // ? Mi manera de cambiar la palabra Clicks
  // String msgCounter = 'Clicks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Counter Screen'))),
        body: Center(
            child: Column(
                // Layout de widgets en forma de columna, tambien existe en fila (row)
                mainAxisAlignment: MainAxisAlignment
                    .center, // Esto es parecido a Flex de CSS, alineamiento de los hijos que van en un arreglo
                children: [
              // ! Antes aqui llevaba const antes de los corchetes, pero ahora como el valor del texto muta lo borramos.
              Text(
                  '$clickCounter', // ? agregamos el estado que queremos mostrar.
                  style: const TextStyle(
                      // ! Como los hijos ya no pueden ser constantes debemos marcar individualmente que valores se mantendran constantes.
                      fontSize: 160,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255))),
              Text(
                  'Click${clickCounter == 1 ? '' : 's'}', // ? Forma pro de cambiar la palabra clicks
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 25))
            ])),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // * Al presionar debemos volver a renderizar para mostrar los cambios y para esto se utiliza el método setState que es propio de la clase _CounterScreenState que extiende de State, por lo tanto pdriamos renderizar en cualquier parte,  tambien renderiza si no ponemos nada en el cuerpo setState(() {});
              setState(() {
                clickCounter++;
                // ? Mi manera de cambiar la palabra Clicks
                // (clickCounter == 1)
                //     ? msgCounter = 'Click'
                //     : msgCounter = 'Clicks';
              });
            },
            child: const Icon(Icons.plus_one)),
        backgroundColor: const Color.fromARGB(255, 0, 255, 106));
  }
}
