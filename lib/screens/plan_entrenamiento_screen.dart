import 'package:flutter/material.dart';

class PlanEntrenamientoScreen extends StatelessWidget {
  final List<String> planesEjemplo = [
    "Lunes: Cardio + Piernas",
    "Miércoles: Resistencia + Brazos",
    "Viernes: Full body + Estiramientos"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Plan de Entrenamiento")),
      body: ListView.builder(
        itemCount: planesEjemplo.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                planesEjemplo[index],
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
