class Baby {
  int age;

  Baby({required this.age});

  Future<int> getBabies() async {
    await Future.delayed(Duration(seconds: 5));

    if (age > 1 && age < 5) {
      return 4;
    } else if (age <= 1) {
      return 0;
    } else {
      return 2;
    }
  }

  Stream<String> bark() async* {
    for (int i = 1; i < age; i++) {
      await Future.delayed(Duration(seconds: 5));
      yield "Bark $i times";
    }
  }
}
