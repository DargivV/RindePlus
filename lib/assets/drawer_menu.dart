import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menú de Navegación', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            title: Text('Estadísticas'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/stats');
            },
          ),
          ListTile(
            title: Text('Otra Sección (Futura)'),
            onTap: () {
              // Aquí puedes agregar nuevas rutas
            },
          ),
        ],
      ),
    );
  }
}
