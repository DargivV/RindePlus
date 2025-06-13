import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedRole = 'deportista';

  void _registrarUsuario() {
    final nombre = _nameController.text.trim();

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa un nombre válido.')),
      );
      return;
    }

    // Muestra mensaje simulado de registro
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registrado "$nombre" como $_selectedRole. (Ejemplo sin BD)'),
      ),
    );

    Navigator.pop(context); // Vuelve a la pantalla anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedRole,
              decoration: InputDecoration(
                labelText: 'Rol',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              items: ['deportista', 'psicologo', 'entrenador']
                  .map((role) => DropdownMenuItem(
                        value: role,
                        child: Text(role[0].toUpperCase() + role.substring(1)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _registrarUsuario,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Registrar', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
