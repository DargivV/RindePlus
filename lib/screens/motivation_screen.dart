import 'package:flutter/material.dart';

class MotivationScreen extends StatelessWidget {
  // Ejemplos de mensajes motivacionales enviados por el psicólogo y entrenador
  final List<Map<String, String>> mensajes = [
    {
      'autor': 'Psicólogo',
      'mensaje': 'Recuerda que tu mente es tan fuerte como tu cuerpo. ¡Tú puedes!'
    },
    {
      'autor': 'Entrenador',
      'mensaje': 'Cada entrenamiento es un paso más cerca del éxito. ¡Sigue adelante!'
    },
    {
      'autor': 'Psicólogo',
      'mensaje': 'La motivación te inicia, el hábito te mantiene. ¡No te detengas!'
    },
    {
      'autor': 'Entrenador',
      'mensaje': '¡Hoy es el día para romper tus propios récords!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Motivación')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: mensajes.length,
          separatorBuilder: (context, index) => Divider(height: 20),
          itemBuilder: (context, index) {
            final mensaje = mensajes[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orange.shade200),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mensaje['autor'] ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    mensaje['mensaje'] ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
