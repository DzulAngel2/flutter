class Bag {
  String name;
  String imagePath;

  Bag({
    required this.name,
    required this.imagePath,
  });
}

List<Bag> listOfBags() {
  return [
    Bag(name: "Sabila", imagePath: "plant1.jpg"),
    Bag(name: "Limón", imagePath: "plant2.jpg"),
    Bag(name: "Tomate", imagePath: "plant3.jpg"),
    Bag(name: "Habanero", imagePath: "plant4.jpg"),
  ];
}
