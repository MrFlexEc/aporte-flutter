import 'package:flutter/material.dart';
import 'package:aporte_flutter/model/bus.dart';
class BusDetailScreen extends StatelessWidget {
  final Bus bus;
  BusDetailScreen({required this.bus});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(children: [
            Text("ID: ${bus.id.toString()}"),
            SizedBox(height: 20,),
            Text("MARCA: ${bus.marca}"),
            SizedBox(height: 20,),
            Text(bus.anio.toString()),
            SizedBox(height: 20,),
            Text(bus.placa),
            SizedBox(height: 60,),
            IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.arrow_back)),
          ]),
            
        ),
      ),
    );
  }
}