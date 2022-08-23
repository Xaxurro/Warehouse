import 'dart:io';

void main(List<String> arguments) {
  print('Hello world!');

  objeto o1 = objeto();
  o1.setName = "jaime";
  print(o1.getName);
}

class objeto {
  String name = "";
  String stock = "";
  String location = "";
  String state = "";
  //var img = "";

  objeto() {
    print("objeto creado!");
  }

  set setName(String name) {
    this.name = name;
  }

  String get getName {
    return name;
  }
}
