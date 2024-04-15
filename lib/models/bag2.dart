class Bag2 {
  String name;
  String imagePath;

  Bag2({
    required this.name,
    required this.imagePath,
  });
}

List<Bag2> listOfBags() {
  return [
    Bag2(name: "Sabila", imagePath: "plant1.jpg"),
    Bag2(name: "Limón", imagePath: "plant2.jpg"),
    Bag2(name: "Tomate", imagePath: "plant3.jpg"),
    Bag2(name: "Habanero", imagePath: "plant4.jpg"),
  ];
}
