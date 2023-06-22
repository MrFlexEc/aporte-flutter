import 'package:aporte_flutter/widget/BusWidget.dart';
import 'package:flutter/material.dart';
import 'package:aporte_flutter/model/Backend.dart';
import 'package:aporte_flutter/model/bus.dart';

class BusListScreen extends StatefulWidget {
  final List<Bus> bus;
  BusListScreen({required this.bus});
  @override
  State<BusListScreen> createState() => _BusListScreenState();
}
class _BusListScreenState extends State<BusListScreen> {
  void deleteEmail(int id){
    Backend().deleteBus(id);
    setState(() {
      widget.bus.removeWhere((email) => email.id == id);
    });
  }
  void markBusAsRead(int id){ 
    Backend().markBusAsRead(id);
    setState(() {
      widget.bus.firstWhere((email) => email.id == id).read = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Api'),
        backgroundColor: Colors.blue[100],
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: Backend().getBuses().map((Bus) => BusWidget(bus: Bus)).toList(),
        ),
        
      ),
    );
  }
}