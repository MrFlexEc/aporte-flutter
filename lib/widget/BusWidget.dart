import 'package:flutter/material.dart';
import 'package:aporte_flutter/model/bus.dart';
import 'package:aporte_flutter/screen/BusDetailScreen.dart';
import 'package:aporte_flutter/model/Backend.dart';

class BusWidget extends StatefulWidget {
  const BusWidget({Key?key, required this.bus}): super(key: key);
  final Bus bus;
  @override
  State<BusWidget> createState() => _BusWidgetState();
}
class _BusWidgetState extends State<BusWidget> {

  Color iconColor = Colors.green;

  void changeIconColor(){
    setState(() {
      iconColor = Colors.red;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.bus.id.toString()), 
      background: Container(
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction){
        Backend().deleteBus(widget.bus.id);
      },
      child: GestureDetector(
        onTap: () {
          Backend().markBusAsRead(widget.bus.id);
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> BusDetailScreen(bus: widget.bus,)));
          changeIconColor();
        },
        onLongPress: (){
          Backend().markBusAsRead(widget.bus.id);
          changeIconColor();
        },
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.bus_alert_rounded, color: iconColor,),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text(widget.bus.anio.toString(),),
                        Text(widget.bus.marca, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(widget.bus.placa)
                      ],
                    )
                  ]
                ),
          ),
        ),
      )
    );
  }
}