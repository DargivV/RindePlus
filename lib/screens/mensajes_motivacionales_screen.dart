import 'package:flutter/material.dart';

class MensajesMotivacionalesScreen extends StatelessWidget {
  final List<String> mensajesEjemplo = [
    "¡Tú puedes con todo!",
    "Cada paso cuenta, no te detengas.",
    "Hoy es un buen día para mejorar."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mensajes Motivacionales")),
      body: ListView.builder(
        itemCount: mensajesEjemplo.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.orange.shade100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                mensajesEjemplo[index],
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
          );
        },
      ),
    );
  }
}
