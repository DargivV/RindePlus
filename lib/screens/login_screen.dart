import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();

  // Ejemplos de usuarios con roles
  final Map<String, String> usuariosEjemplo = {
    'daniel': 'deportista',
    'carlos': 'psicologo',
    'kelly': 'entrenador',
  };

  void _login() {
    final nombre = _nameController.text.trim().toLowerCase();

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor ingresa un nombre')),
      );
      return;
    }

    if (usuariosEjemplo.containsKey(nombre)) {
      String rol = usuariosEjemplo[nombre]!;

      // Redirigir según rol
      switch (rol) {
        case 'deportista':
          Navigator.pushReplacementNamed(context, '/home');
          break;
        case 'psicologo':
          Navigator.pushReplacementNamed(context, '/psicologo');
          break;
        case 'entrenador':
          Navigator.pushReplacementNamed(context, '/entrenador');
          break;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario no registrado')),
      );
    }
  }

  void _goToRegister() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/logo.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _goToRegister,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      side: BorderSide(color: Colors.orange, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text('Registrar', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
