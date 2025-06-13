
import 'package:flutter/material.dart';

class PsicologoScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Psicólogo')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enviar mensaje motivacional al deportista:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: _messageController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Escribe tu mensaje aquí...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String mensaje = _messageController.text;
                if (mensaje.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Mensaje enviado: "$mensaje"')),
                  );
                  _messageController.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
