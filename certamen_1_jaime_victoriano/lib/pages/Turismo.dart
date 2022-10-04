import 'package:certamen_1_jaime_victoriano/functions.dart';
import 'package:flutter/material.dart';

class TurismoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        tile("Viajes", "Informacion de los viajes", Icons.airplane_ticket),
        Divider(thickness: 1),
        tile("Conversion de Monedas", "Cambio de dinero", Icons.hotel),
        Divider(thickness: 1),
        tile("Sitios de interes", "Lugares de interes", Icons.location_city),
        Divider(thickness: 1),
        tile("Recomendaciones", "Deje una reseña", Icons.star),
        Divider(thickness: 1),
      ],
    );
  }
}
