class Dog {
  final String name;
  int age;
  final String breed;

  Dog({required this.name, this.age = 1, required this.breed});

  void grow() {
    age++;
    print(age);
  }
}
