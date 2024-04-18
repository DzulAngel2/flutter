

class Order {
  List<String> products;
  List<int> quantities;
  double totalPrice;

  Order(this.products, this.quantities, this.totalPrice);
}

List<Order> ordenes = [];

void guardarOrdenes(List<Order> nuevasOrdenes) {
  ordenes.addAll(nuevasOrdenes);
}
