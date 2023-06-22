class Bus {
  final int id;
  final String placa;
  final int anio;
  final String marca;
  bool read;

  Bus({
    required this.id,
    required this.placa,
    required this.anio,
    required this.marca,
    this.read = false,
  });
}
