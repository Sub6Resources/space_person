class Person {
  String craft;
  String name;

  Person({this.craft, this.name});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      craft: json['craft'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'craft': craft,
      'name': name,
    };
  }
}
