
import 'package:flutter/material.dart';

class EntrenadorScreen extends StatelessWidget {
  final TextEditingController _planController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Entrenador')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Planificar calendario de entrenamiento:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: _planController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Escribe el plan de entrenamiento...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String plan = _planController.text;
                if (plan.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Plan agregado: "$plan"')),
                  );
                  _planController.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text('Agregar al calendario'),
            ),
          ],
        ),
      ),
    );
  }
}
