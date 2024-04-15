class Bag {
  final String name;
  final String imageUrl;
  final String descipcion;
  final double precio;

  Bag({required this.name, required this.imageUrl, required this.descipcion, required this.precio});

  factory Bag.fromJson(Map<String, dynamic> json) {
    return Bag(
        name: json['nombre'],
        imageUrl: json['urlFotoProducto'],
        descipcion: json['descripcion'],
        precio: json['precio']
        );
        
  }
}
