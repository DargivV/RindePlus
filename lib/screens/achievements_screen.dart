import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logros')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: Icon(Icons.star, color: Colors.orange),
              title: Text('Primer entrenamiento completado'),
              subtitle: Text('¡Bien hecho!'),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: Icon(Icons.star_border, color: Colors.grey),
              title: Text('Completa 5 entrenamientos'),
              subtitle: Text('Pendiente'),
              trailing: Icon(Icons.lock_outline),
            ),
          ),
        ],
      ),
    );
  }
}
