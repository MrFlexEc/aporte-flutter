import 'bus.dart';

class Backend {
  static final Backend _backend = Backend._internal();

  factory Backend(){
    return _backend;
  }

  Backend._internal();

  final _buses = [
    Bus(id: 1, placa: "MBF-0987", anio: 2000, marca: "Chevrolet"),
    Bus(id: 2, placa: "MBE-787", anio: 2001, marca: "Hino"),
    Bus(id: 3, placa: "GYE-567", anio: 2002, marca: "Mercedes Benz"),
    Bus(id: 4, placa: "PCY-056", anio: 2003, marca: "Honda"),
    Bus(id: 5, placa: "OBF-412", anio: 2004, marca: "Changan"),
    Bus(id: 6, placa: "MBB-1239", anio: 2005, marca: "Ford"),
    Bus(id: 7, placa: "GYM-0912", anio: 2006, marca: "Honda"),
    Bus(id: 8, placa: "PCE-1901", anio: 2007, marca: "Hino"),
    Bus(id: 9, placa: "ACE-1831", anio: 2008, marca: "Mercedes Benz"),
    Bus(id: 10, placa: "GAY-128", anio: 2009, marca: "Lamborghini"),
  ];

  List<Bus> getBuses() {
    return _buses;
  }

  void markBusAsRead(int id) {
    final index = _buses.indexWhere((email) => email.id == id);
    _buses[index].read = true;
  }

  void deleteBus(int id) {
    _buses.removeWhere((email) => email.id == id);
  }
}