class Cat {
  int id;
  String name;
  String description;
  String image;

  Cat(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
        id: int.parse(json['id'].toString()),
        name: json['name'],
        description: json['description'],
        image: json['image']);
  }
}
